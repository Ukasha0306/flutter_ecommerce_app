
import 'dart:developer';

import 'package:flutter_ecommerce_app/data/repositories/brand/brand_repository.dart';
import 'package:flutter_ecommerce_app/data/repositories/products/product_repository.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import '../models/brand_model.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();


  final brandRepository = Get.put(BrandRepository());
  RxBool isLoading = false.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;






  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }


  // Load Brand

    Future<void> getFeaturedBrands()async{
    try{
      isLoading.value = true;


      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    }
    catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
    finally{

      isLoading.value = false;
    }
    }

    // Get Brand for category

  Future<List<BrandModel>> getBrandsForCategory(String categoryId)async{
    try{
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    }
    catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }

  }



    // get brand Specific products from your data source

    Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1})async{
    try{
      final product = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return product;


    }
    catch(e){
      log("Error in get brand product $e");
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];

    }
    }
}