import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/images/rounded_images.dart';
import 'package:flutter_ecommerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';


class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sport', style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body:  SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(TSizes.defaultSpace),
         child: Column(
           children: [
             const TRoundedImage(imageUrl: TImages.banner3, width: double.infinity, applyImageRadius: true),
             const SizedBox(height: TSizes.spaceBtwSections,),
             TSectionHeading(title: "Sport Shirt", onPressed: (){},),
             const SizedBox(height: TSizes.spaceBtwItems/2,),
             SizedBox(
               height: 120,
               child: ListView.separated(
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemCount: 4,
                   separatorBuilder: (_, __)=>const SizedBox(width: TSizes.spaceBtwItems,),
                   itemBuilder:(_, index)=> const TProductCardHorizontal()),
             ),

           ],
         ),
       ),
      ),

    );
  }
}
