import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/cart_item.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=> Get.to(()=>const CheckoutScreen()), child: const Text('Checkout \$256.0'),),
      ),

    );
  }
}




