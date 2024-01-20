import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';


class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration:
            const InputDecoration(
              prefixIcon: Icon(Icons.sort),
            ),
            items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((option) => DropdownMenuItem(value: option , child: Text(option))).toList(),
            onChanged: (value) {}),
        const SizedBox(height: TSizes.spaceBtwSections,),
        TGridLayout(itemCount: 12, itemBuilder: (_, index)=> TProductCardVertical(product:ProductModel.empty() ,))
      ],
    );

  }
}