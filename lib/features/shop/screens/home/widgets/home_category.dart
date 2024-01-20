
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/categories_shimmer.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/sub_category/sub_category.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if(categoryController.isLoading.value) return  const TCategoryShimmer();

      if(categoryController.featuredCategories.isEmpty){
        return Center(child: Text("No Data Found!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
      }
      return SizedBox(
        height: 100,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categoryController.featuredCategories.length,
            itemBuilder: (context, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalImageText(
                  image: category.image,
                  title: category.name,
                  onTap: () => Get.to(() => const SubCategoriesScreen()));
            }),
      );
    });
  }
}
