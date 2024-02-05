import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget {
  final int itemCount;
  const THorizontalProductShimmer({super.key,  this.itemCount=4});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.defaultSpace* 1.3),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index)=> const SizedBox(width: TSizes.spaceBtwItems,),
        itemCount: itemCount,
        itemBuilder: (_,__){
        return const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSizes.spaceBtwItems,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TSizes.spaceBtwItems/2,),
                TShimmerEffect(width: 160, height: 15),
                SizedBox(height: TSizes.spaceBtwItems/2,),
                TShimmerEffect(width: 110, height: 15),
                SizedBox(height: TSizes.spaceBtwItems/2,),
                TShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            )

          ],
        );
        },),

    );
  }
}
