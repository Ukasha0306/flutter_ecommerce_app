import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/t_brand_title_text.dart';
import 'package:flutter_ecommerce_app/utils/constants/enums.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/color.dart';


class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  final String title;
  final int maxLine;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;
  const TBrandTitleWithVerifiedIcon({
    required this.title,
    this.maxLine = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
      Flexible(
        child: TBrandTitle(
          title: title,
          textAlign: textAlign,
          maxLines: maxLine,
          color: textColor,
          brandTextSizes: brandTextSizes,
        ),
      ),
        const SizedBox(
          width: TSizes.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}