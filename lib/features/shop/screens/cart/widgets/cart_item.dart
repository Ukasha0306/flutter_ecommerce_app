import 'package:flutter/material.dart';
import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/t_product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  final bool showAddAndRemoveButtons;
  const TCartItems({super.key, this.showAddAndRemoveButtons = true});

  @override
  Widget build(BuildContext context) {
    return ListView.separated( separatorBuilder: (_, __)=>const SizedBox(height: TSizes.spaceBtwSections,),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (_, index)=>Column(
        children: [
          const TCartItem(),
          if(showAddAndRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems,),
          if(showAddAndRemoveButtons) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Row(
                children: [
                  SizedBox(width: 70,),
                  TProductQuantityWithAddAndRemoveButton(),
                ],
              ),
              TProductPriceText(price: '256'),
            ],
          ),
        ],
      ),
    );
  }
}
