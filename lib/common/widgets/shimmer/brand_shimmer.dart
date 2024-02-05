import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';



class TBrandShimmer extends StatelessWidget {
  final int itemCount;
  const TBrandShimmer({super.key,  this.itemCount =4});

  @override
  Widget build(BuildContext context) {
    return TGridLayout(itemCount: itemCount, itemBuilder: (_, __)=>const TShimmerEffect(width: 300, height: 300));
  }
}
