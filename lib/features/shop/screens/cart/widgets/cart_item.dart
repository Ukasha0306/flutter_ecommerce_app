import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/t_product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  final bool showAddAndRemoveButtons;

  const TCartItems({super.key, this.showAddAndRemoveButtons = true});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(()=> ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemCount: controller.cartItems.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return Obx(
            () {
              final item = controller.cartItems[index];
              return Column(
                children: [
                  TCartItem(cartItem: item),
                  if (showAddAndRemoveButtons)
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                  if (showAddAndRemoveButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 70,
                            ),
                            TProductQuantityWithAddAndRemoveButton(
                              quantity: item.quantity,
                              add: () => controller.addOneToCart(item),
                              remove: () => controller.removeOneToCart(item),
                            ),
                          ],
                        ),
                         TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                      ],
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
