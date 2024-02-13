import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'change',
          onPressed: () => controller.selectNewAddressPopup(context),
        ),
        controller.selectedAddress.value.id.isNotEmpty
            ? Obx(()=>
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.selectedAddress.value.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: TColors.grey,
                          size: 16,
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        Text(
                          controller.selectedAddress.value.phoneNumber,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_history,
                          color: TColors.grey,
                          size: 16,
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        Expanded(
                            child: Text(
                          controller.selectedAddress.value.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                      ],
                    ),
                  ],
                ),
            )
            : Text(
                "Select Address",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
      ],
    );
  }
}


