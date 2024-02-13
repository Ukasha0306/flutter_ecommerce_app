
import 'dart:convert';

import 'package:flutter_ecommerce_app/data/repositories/products/product_repository.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/utils/local_storage/storage_utility.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController{

  static FavouriteController get instance => Get.find();

  // variable
    final favourites = <String, bool>{}.obs;


    @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  Future<void>initFavourites()async{
      final json = TLocalStorage.instance().readData('favourites');
      if(json != null){
        final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
        favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
      }
  }

  bool isFavourite(String productId){
      return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId){
      // if product is not add then add the product... ! mean not added
      if(!favourites.containsKey(productId)){
        favourites[productId] = true;
        saveFavouritesToStorage();
        TLoaders.customToast(message: 'Product has been added to the wishlist');
      }
      else{
        TLocalStorage.instance().removeData(productId);
        favourites.remove(productId);
        saveFavouritesToStorage();
        favourites.refresh();
        TLoaders.customToast(message: 'Product has been removed from the wishlist');

      }
  }

  void saveFavouritesToStorage(){
      final encodedFavourites = json.encode(favourites);
      TLocalStorage.instance().writeData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts()async{
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());

  }

}
