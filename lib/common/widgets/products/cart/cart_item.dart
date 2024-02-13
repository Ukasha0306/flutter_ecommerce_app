import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/shop/models/cart_item_model.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_images.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_with_verified_icon.dart';


class TCartItem extends StatelessWidget {
  final CartItemModel cartItem;
  const TCartItem({
    super.key, required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(imageUrl: cartItem.image ?? '',
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          isNetworkImage: true,
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
               Flexible(child: ProductTitleText(title: cartItem.title, maxLine: 1,)),
              Text.rich(TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries.map((e) => TextSpan(
                    children: [
                      TextSpan(text: '${e.key} ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '${e.value} ', style: Theme.of(context).textTheme.bodyLarge),
                    ]
                  )
                  ).toList(),
              ))
            ],
          ),
        )
      ],
    );
  }
}