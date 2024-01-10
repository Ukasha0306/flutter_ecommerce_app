import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/color.dart';


class TCartCounterIcon extends StatelessWidget {
  final Color? iconColor;
  final VoidCallback onPressed;
  const TCartCounterIcon({
    super.key, this.iconColor, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: ()=>Get.to(()=>const CartScreen()), icon:   Icon(Iconsax.shopping_bag, color: iconColor,),),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: TColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text("2", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white, fontSizeFactor: 0.8)),
            ),
          ),
        ),
      ],
    );
  }
}