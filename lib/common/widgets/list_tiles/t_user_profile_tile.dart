import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/t_circular_image.dart';
import '../shimmer/shimmer_effect.dart';

class TUserProfileTile extends StatelessWidget {
  final VoidCallback onPressed;
  const TUserProfileTile({
    super.key, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(
            () {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : TImages.user;
          return controller.imageUploading.value ? const TShimmerEffect(width: 80, height: 80) : TCircularImage(
            image: image,
            height: 50,
            width: 50,
            padding: 0,
            isNetworkImage: networkImage.isNotEmpty,
          );
        },
      ),

      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white,),),
    );
  }
}

