import 'package:flutter_ecommerce_app/data/repositories/products/product_repository.dart';
import 'package:flutter_ecommerce_app/utils/constants/enums.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final productRepo = Get.put(ProductRepository());

  final isLoading = false.obs;

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchFeaturedProducts();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepo.getFeaturedProducts();

      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // get the product price or price range for variations

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if no variation exist, return simple price or sale price

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    }
    else {
      // Calculate the smallest and largest price among variations
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available , otherwise regular price)

        double priceToConsider = variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price;

        // update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
          print("thhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh$smallestPrice");
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }



      // if smallest and largest price are the same, then return a single price

      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      }
      else {
        // otherwise return a price rang
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }



    // calculate discount percentage
    String? calculateSalePercentage(double originalPrice, double? salePrice) {
      if (salePrice == null || salePrice <= 0.0) return null;
      if (originalPrice <= 0) return null;
      double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
      return percentage.toStringAsFixed(0);
    }

    // check product stock
    String getProductStockStatus(int stock) {
      return stock > 0 ? 'In Stock' : 'Out of Stock';
    }
  }

