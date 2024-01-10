import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:flutter_ecommerce_app/navigation_menu.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/appBar/app_bar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =  THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text('Order Review',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body:   SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddAndRemoveButtons: false,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections,),

              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    TBillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=> Get.to(()=> SuccessScreen(
            title: "Payment Success!",
            subTitle: "Your Item will be shipped soon!",
            image: TImages.successfulPaymentIcon,
            onPressed:()=> Get.offAll(()=>const NavigationMenu()),),),
          child: const Text('Checkout \$256.0'),),
      ),
    );
  }
}


