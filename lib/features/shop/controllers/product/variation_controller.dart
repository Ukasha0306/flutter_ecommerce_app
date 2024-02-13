
import 'package:flutter_ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/image_controller.dart';
import 'package:get/get.dart';
import '../../models/product_model.dart';
import '../../models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  // select attribute and variation

  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    // attributeName = key, attributeValue = value.
    // when attribute is selected we wil first add that attribute to the selectedAttributes
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName]=attributeValue;

    final selectedVariation = product.productVariations!.firstWhere((variation) => _isSameAttributesValues(variation.attributeValues, selectedAttributes),
        orElse: ()=>ProductVariationModel.empty() );

    // show the selected variation image as main image
    if(selectedVariation.image.isNotEmpty){
      ImageController.instance.selectedProductImage.value = selectedVariation.image;
    }
    // Show selected variation quantity already in the cart

    if(selectedVariation.id.isNotEmpty){
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }
    // assign selected product variation status
    this.selectedVariation.value = selectedVariation;

    // update selected product variation stock
    getProductVariationStockStatus();
  }

  // check if the selected attributes matches any variation attributes
  bool _isSameAttributesValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes){
    // if the selectedAttributes contain 3 attributes and current variation contain 2 then return
    if(variationAttributes.length != selectedAttributes.length) return false;

    // if any of the attributes is different then return . e.g [Green , large] x [Green small]

    for(final key in variationAttributes.keys){
      // Attributes[key] = value which could be [Green, Small, Cotton] etc.
      if(variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  // check Attribute availability stock in variation
  Set<String?> getAttributeAvailabilityInVariation(List<ProductVariationModel> variation, String attributeName) {
    // pass the variation to check which attributes are available and stock is not  0

    final availableVariationAttributesValues = variation.where((variation) =>
    variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0).
        map((variation) => variation.attributeValues[attributeName]).
    toSet();

    return availableVariationAttributesValues;
  }

  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  // check Product Variation Stock Status

  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';

  }

  // Reset Selected Attribute when switching products

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
