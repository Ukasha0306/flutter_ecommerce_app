import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:get/get.dart';
import '../../../../../common/appBar/app_bar.dart';
import '../../../../../common/widgets/products/cart/cart_counter_icon.dart';
import '../../../../../common/widgets/shimmer/shimmer_effect.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const TShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: const [
        TCartCounterIcon(
          iconColor: TColors.white,
        ),
      ],
    );
  }
}
