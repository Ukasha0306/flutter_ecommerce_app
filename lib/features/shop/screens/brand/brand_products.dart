
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/brands/brand_card.dart';
import 'package:flutter_ecommerce_app/common/widgets/products/sortable/sortable_product.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/brand_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/models/brand_model.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/cloud_helper_function.dart';

class BrandProducts extends StatelessWidget {
  final BrandModel brand;
  const BrandProducts({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return  Scaffold(
      appBar:  TAppBar(title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(brand :brand, showBorder: true),
              const SizedBox(height: TSizes.spaceBtwSections,),
              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id,),
                builder: (context, snapshot) {

                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader:  loader);
                  if(widget != null) return widget;

                  final brandProducts = snapshot.data!;
                  return  TSortableProducts(products: brandProducts);
                }
              ),
            ],
          ),
        ),
      ),

    );
  }
}
