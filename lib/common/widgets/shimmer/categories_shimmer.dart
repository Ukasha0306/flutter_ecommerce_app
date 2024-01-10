import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  final int itemCount;

  const TCategoryShimmer({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            children: [
              TShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
