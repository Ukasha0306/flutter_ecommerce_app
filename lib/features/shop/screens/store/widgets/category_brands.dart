
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/brand_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/cloud_helper_function.dart';
import '../../../../../common/widgets/brands/brand_show_case.dart';

class CategoryBrands extends StatelessWidget {
  final CategoryModel category;
  const CategoryBrands({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return  FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder:(context, snapshot){
        const loader  = Column(
          children: [
            TListTileShimmer(),
            SizedBox(height: TSizes.spaceBtwItems,),
            TBoxesShimmer(),
            SizedBox(height: TSizes.spaceBtwItems,),
          ],
        );
        final widget = TCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);
        if(widget != null) return widget;

        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:brands.length ,
            itemBuilder: (_, index){
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                final widget = TCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);
                if(widget != null) return widget;

                final products = snapshot.data!;

                return TBrandShowCase(
                  brand: brand,
                  images: products.map((e) => e.thumbnail).toList(),
                   );
              }
            );
            });

      }
    );
  }
}
