
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      backgroundColor: dark ? TColors.dark : TColors.white,
      child: Row(
        children: [
          Flexible(child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Have a promo code? Enter here',
            ),
          ),),
          SizedBox(width: 80 ,
              child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  foregroundColor: dark ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
                  backgroundColor: TColors.grey.withOpacity(0.2),
                  side: BorderSide(color: TColors.grey.withOpacity(0.1),),
                ),
                child: const Text('Apply'),)),
        ],
      ),

    );
  }
}