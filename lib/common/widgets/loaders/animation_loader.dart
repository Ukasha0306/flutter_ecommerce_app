
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  final String text;
  final String animation;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final bool showAction;
  const TAnimationLoaderWidget({super.key, required this.text, required this.animation, this.actionText, this.onActionPressed,  this.showAction = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation, width: MediaQuery.sizeOf(context).width* 0.80),
          const SizedBox(height: TSizes.defaultSpace,),
          Text(text, style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace,),
          showAction ? SizedBox(
            width: 250,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
              child: Text(actionText!, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),),
            ),
          ): const SizedBox(),
        ],
      ),
    );
  }
}
