import 'package:flutter_ecommerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/utils/constants/enums.dart';
import 'package:flutter_ecommerce_app/utils/local_storage/storage_utility.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../models/cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  final variationController = VariationController.instance;

  CartController(){
    loadCartItems();
  }

  // Add item to cart
  void addToCart(ProductModel product) {

    // variation selected

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoaders.customToast(message: 'Select Variation');
      return;
    }

    // Quantity check
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: 'Select Quantity');
      return;
    }



    // out of stock

    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        TLoaders.warningSnackBar(message: 'Selected variation is out of stock.', title: 'Oh snap!');
        return;
      }
    } else {
      if (product.stock < 1) {
        TLoaders.warningSnackBar(
            message: 'Selected product is out of stock.', title: 'Oh snap!');
        return;
      }
    }

    // Convert the Product model to a cartItemModel with the given quantity

    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);
    // check if it is already added in the cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // this quantity is already added or Updated/Removed from the design Cart(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    TLoaders.customToast(message: 'Your product has been added in the Cart.');
  }

  void addOneToCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    if(index >=0){
      cartItems[index].quantity += 1;
    }
    else{
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneToCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    if(index >=0){
      // if greater than zero
    if(cartItems[index].quantity > 1){
      cartItems[index].quantity -=1;
    }
    else{
      // show the dialog
      cartItems[index].quantity == 1 ? removeFromCartDialog(index): cartItems.removeAt(index);
    }
    updateCart();
    } 
  }

  void removeFromCartDialog(int index){
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: (){
        cartItems.removeAt(index);
        updateCart();
        TLoaders.customToast(message: 'Product removed from the cart.');
        Get.back();
      },
      onCancel: ()=> ()=>Get.back(),
    );
  }

  // this is function converts a ProductModel to cartItemModel

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // reset Variation in case of single product type
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;

    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price:price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  // update Cart Values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {

    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems(){
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

  void loadCartItems(){
    final cartItemStrings = TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if(cartItemStrings != null){
      cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String , dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId){
    final foundItem = cartItems.where((item) => item.productId==productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId){
    final foundItem =cartItems.firstWhere((element) => element.productId == productId && element.variationId == variationId,
      orElse: ()=>CartItemModel.empty(),
    );
    return foundItem.quantity;
  }


// initialize already added item's count in the cart

  void updateAlreadyAddedProductCount(ProductModel product){
    // if the product has no variation then calculate cart entries and display the total number.
    // Else make default entries to 0 and show the cartEntries when variable is selected.

    if(product.productType == ProductType.single.toString()){
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }
    else{
      // get selected variation
      final variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      }
      else{
        productQuantityInCart.value = 0;
      }
    }
  }
  void clearCart(){
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
