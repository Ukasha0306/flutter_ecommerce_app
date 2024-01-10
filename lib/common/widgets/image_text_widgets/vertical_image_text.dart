import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/images/t_circular_image.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage ;
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.isNetworkImage =true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(image: image , fit: BoxFit.fitWidth, padding: TSizes.sm *1.4, isNetworkImage: isNetworkImage, backgroundColor: backgroundColor,
            overLayColor: dark ? TColors.light : TColors.dark,
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
// height: 56,
// width: 56,
// padding: const EdgeInsets.all(TSizes.sm),
// decoration: BoxDecoration(
// color: backgroundColor ?? (dark ? TColors.black : TColors.white),
// borderRadius: BorderRadius.circular(100),
// ),
// child: Center(
// child: Image(
// image: AssetImage(
// image,
// ),
// fit: BoxFit.cover,
// color: dark ? TColors.light : TColors.dark,
// ),
// ),
// ),