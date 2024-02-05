
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:flutter_ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/store/widgets/category_brands.dart';
import 'package:flutter_ecommerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  final CategoryModel category;
  const TCategoryTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
             CategoryBrands(category: category),
              const SizedBox(height: TSizes.spaceBtwItems,),
              FutureBuilder(
                future: controller.getProductsForCategory(categoryId: category.id),
                builder: (_, snapshot){
                  final response = TCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: const TVerticalProductShimmer());
                  if(response != null) return response;
                  final products = snapshot.data!;
                  return Column(
                    children: [
                      TSectionHeading(title: 'You might Like',
                        onPressed: ()=>Get.to(()=>AllProducts(
                          title: category.name,
                          futureMethod: controller.getProductsForCategory(categoryId: category.id, limit: -1),
                        )),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems,),
                      TGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index)=> TProductCardVertical(product: products[index]),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems,),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
