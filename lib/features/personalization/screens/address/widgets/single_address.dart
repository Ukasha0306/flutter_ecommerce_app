import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';

class TSingleAddress extends StatelessWidget {
  final bool selectedAddress;
  const TSingleAddress({super.key, required this.selectedAddress});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? TColors.darkerGrey :TColors.grey,
      child: Stack(
        children: [
          Positioned(
            top: 0,
              right: 5,
              child: Icon(selectedAddress ? Iconsax.tick_circle5 : null, color: selectedAddress ? dark ? TColors.light : TColors.dark.withOpacity(0.6) : null,),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jhon Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm/2,),
              const Text('(+123) 456 7894', maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: TSizes.sm/2,),
              const Text('936 Kiehn Route, West Ned, Tennessee, 11230, USA', softWrap: true,),
            ],
          )
        ],
      ),



    );
  }
}
