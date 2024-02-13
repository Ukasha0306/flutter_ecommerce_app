
import 'package:flutter_ecommerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutter_ecommerce_app/utils/connectivity/network_manager.dart';
import 'package:get/get.dart';
import '../features/personalization/controllers/address_controller.dart';
import '../features/shop/controllers/product/variation_controller.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}