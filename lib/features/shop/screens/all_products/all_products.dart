import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/all_product_controller.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/products/sortable/sortable_product.dart';
import '../../models/product_model.dart';



class AllProducts extends StatelessWidget {
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return  Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductByQuery(query),
            builder: (context, snapshot) {
              // check the state of the futureBuilder snapshot
              const loader = TVerticalProductShimmer();
             final widget = TCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);

             if(widget != null) return widget;

              // Product found!
              final products = snapshot.data!;
              return  TSortableProducts(products: products,);
            }
          ),
        ),
      ),
    );
  }
}


