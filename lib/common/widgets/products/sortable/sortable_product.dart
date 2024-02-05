import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/all_product_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';


class TSortableProducts extends StatelessWidget {
  final List<ProductModel> products;
  const TSortableProducts({

    super.key, required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProduct(products);
    return Column(
      children: [
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.sort),
            ),
            items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((option) => DropdownMenuItem(value: option , child: Text(option))).toList(),
            onChanged: (value) {
              // sort products based on the selected option
              controller.sortProducts(value!);
            }),
        const SizedBox(height: TSizes.spaceBtwSections,),
        Obx(()=> TGridLayout(itemCount: controller.products.length, itemBuilder: (_, index)=> TProductCardVertical(product: controller.products[index],)))
      ],
    );

  }
}