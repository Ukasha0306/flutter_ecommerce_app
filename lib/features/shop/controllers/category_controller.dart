
import 'package:flutter_ecommerce_app/data/repositories/category/category_repository.dart';
import 'package:flutter_ecommerce_app/features/shop/models/category_model.dart';
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



}