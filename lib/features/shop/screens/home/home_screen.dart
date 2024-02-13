
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/product_controller.dart';
import '../all_products/all_products.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_category.dart';
import 'widgets/promo_slider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: TSizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: "Popular Categories",
                          textColor: TColors.white,
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        THomeCategories(),
                        SizedBox(height: TSizes.spaceBtwSections,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(title: "Popular Products", onPressed: ()=>Get.to(()=> AllProducts(
                    title: 'Popular Products',
                    futureMethod: controller.fetchAllFeaturedProducts(),
                  ))),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Obx(() {
                    if(controller.isLoading.value) return const TVerticalProductShimmer();
                    if(controller.featuredProducts.isEmpty){
                      return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.headlineMedium,),);
                    }
                    return  TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) {
                        return
                          TProductCardVertical(
                            product: controller.featuredProducts[index],);

                      });
                  })

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
