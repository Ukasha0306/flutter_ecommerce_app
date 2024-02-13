import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_app/navigation_menu.dart';
import 'package:flutter_ecommerce_app/utils/constants/enums.dart';
import 'package:flutter_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/order/order_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../personalization/controllers/address_controller.dart';
import '../../models/order_model.dart';
import 'cart_controller.dart';
import 'checkout_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // Fetch user order history

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh snap!', message: e.toString());
      log("The Error $e");
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.pencilAnimation);

      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add details
      final order = OrderModel(
        // Generate a unique iD for the user
        id: UniqueKey().toString(),
        status: OrderStatus.pending,
        items: cartController.cartItems.toList(),
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        address: addressController.selectedAddress.value,
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        deliveryDate: DateTime.now(),
      );

      // save the order to firestore
      await orderRepository.saveOrder(order, userId);

      // update the cart items
      cartController.clearCart();

      Get.off(()=>SuccessScreen(
          title: 'Payment Success!',
          subTitle: 'Your item will be shipped soon!',
          image: TImages.orderCompletedAnimation,
          isLottie: true,
          onPressed: ()=>Get.offAll(()=>const NavigationMenu()),),);
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
