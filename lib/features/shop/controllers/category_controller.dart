
import 'package:flutter_ecommerce_app/data/repositories/category/category_repository.dart';
import 'package:flutter_ecommerce_app/data/repositories/products/product_repository.dart';
import 'package:flutter_ecommerce_app/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final categoriesRepository = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

    // Load Category data
  Future<void> fetchCategories()async{

    try{
      isLoading.value = true;

      // fetch categories from data source (Firestore)
      final categories = await categoriesRepository.getAllCategories();

     // update the categories list
      /// Replaces all existing items of this list with [items]
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }
    catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
    finally{
      isLoading.value = false;

    }
  }

  // Load selected Category data

  Future<List<CategoryModel>> getSubCategory(String categoryId)async{
    try{
      final subCategories = await categoriesRepository.getSubCategories(categoryId);
      return subCategories;

    }
    catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }


  // get Category or Sub-Category Products.

  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4})async{
    // fetch limited 4 products of each subcategory

    try{
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    }
    catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }


  }

}