import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizes.dart';
import '../shimmer/shimmer_effect.dart';

class TCircularImage extends StatelessWidget {

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overLayColor;
  final Color? backgroundColor;
  final double height, width, padding;

  const TCircularImage({
    this.width = 56,
    this.height = 56,
    this.overLayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child:ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Center(child: isNetworkImage ? CachedNetworkImage(
          fit: fit,
          color: overLayColor,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress)=> const TShimmerEffect(width: 55, height: 55, radius: 55,),
          errorWidget: (context, url, error)=> const Icon(Icons.error),
        ) :Image(
          fit: fit,
          image : AssetImage(image),
          color:  overLayColor
        ),
        ),
      ),
    );
  }
}