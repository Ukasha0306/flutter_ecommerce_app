import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import '../../../utils/constants/color.dart';
class TCircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  const TCircularIcon({
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
    super.key, required this.icon,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null ? backgroundColor! : dark
            ? TColors.black.withOpacity(0.9)
            : TColors.white.withOpacity(0.9),
      ),
      child: IconButton(
          onPressed: onPressed, icon:  Icon(icon, color: color , size: size,)),
    );
  }
}
