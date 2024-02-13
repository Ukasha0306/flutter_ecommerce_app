import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_ecommerce_app/navigation_menu.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/cart_controller.dart';
import 'widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx(() {
        final emptyWidget = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TAnimationLoaderWidget(
              text: 'Whoops! Cart is EMPTY',
              animation: TImages.cartAnimation,
              showAction: true,
              actionText: 'Let\'s fill it',
              onActionPressed: () => Get.off(() => const NavigationMenu()),
            ),
          ],
        );
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TCartItems(),
            ),
          );
        }
      }),
      bottomNavigationBar: Obx((){
        if(controller.cartItems.isEmpty) {
          return const SizedBox();
        }
        else{
          return Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: ElevatedButton(
              onPressed: () => Get.to(() => const CheckoutScreen()),
              child: Text('Checkout \$${controller.totalCartPrice.value}')),
            );
        }
      })
    );
  }
}
