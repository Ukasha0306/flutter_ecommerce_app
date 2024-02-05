import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/appBar/tab_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/brands/brand_card.dart';
import 'package:flutter_ecommerce_app/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/brand_shimmer.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/brand_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/brand/all_brands.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final controller = Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const TSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: true,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      TSectionHeading(
                        title: "Featured Brands",
                        onPressed: ()=> Get.to(()=>const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
                      Obx((){
                        if(controller.isLoading.value){
                          return const TBrandShimmer();
                        }
                        if(controller.featuredBrands.isEmpty){
                          return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
                        }
                        return  TGridLayout(
                          itemCount: controller.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = controller.featuredBrands[index];
                            return  TBrandCard(
                              brand: brand,
                              showBorder: true,
                              onTap: ()=>Get.to(()=>BrandProducts(brand: brand)),
                            );
                          },
                        );
                      }

                      )
                    ],
                  ),
                ),
                bottom:  TTabBar(
                  tab:categories.map((category) => Tab(child: Text(category.name),)).toList()),
                ),
            ];
          },
          body:  TabBarView(
            children: categories.map((category) => TCategoryTab(category: category,)).toList()
          ),
        ),
      ),
    );
  }
}
