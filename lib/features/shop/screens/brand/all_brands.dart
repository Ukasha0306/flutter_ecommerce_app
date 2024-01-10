import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/brands/brand_card.dart';
import 'package:flutter_ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(title: 'Brands', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TGridLayout(itemCount: 10,  mainAxisExtent: 80, itemBuilder: (context, index)=>TBrandCard(showBorder: true, onTap: ()=>Get.to(()=>const BrandProducts()),))

            ],
          ),
        ),
      ),
    );
  }
}
