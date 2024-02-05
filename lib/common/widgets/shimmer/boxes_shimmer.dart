import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}