import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/list_tiles/t_setting_menu_tile.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_app/features/personalization/screens/address/address.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/order/order.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/appBar/app_bar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/t_user_profile_tile.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../profile/profile_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),
                  TUserProfileTile(onPressed: ()=> Get.to(()=>const ProfileScreen()),),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingMenuTile(
                    title: 'My Address',
                    subtitle: 'Set Shopping delivery address',
                    icon: Iconsax.safe_home,
                    onTap: ()=>Get.to(()=>const UserAddressScreen()),
                  ),
                  TSettingMenuTile(
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    icon: Iconsax.shopping_bag,
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    title: 'My Orders',
                    subtitle: 'In-progress and Completed orders',
                    icon: Iconsax.bag_tick,
                    onTap: () => Get.to(()=>const OrderScreen()),
                  ),
                  TSettingMenuTile(
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                    icon: Iconsax.bank,
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    title: 'My Coupons',
                    subtitle: 'List of all discounted coupons',
                    icon: Iconsax.discount_shape,
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    title: 'Notification',
                    subtitle: 'Set any kind of notification message',
                    icon: Iconsax.notification,
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    icon: Iconsax.security_card,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingMenuTile(
                    title: 'Load Data',
                    subtitle: 'Upload data to your Cloud Firebase',
                    icon: Iconsax.document_upload,
                    onTap: (){
                    }
                  ),
                  TSettingMenuTile(
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    icon: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value){},),

                  ),
                  TSettingMenuTile(
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    icon: Iconsax.location,
                    trailing: Switch(value: false, onChanged: (value){},),

                  ),
                  TSettingMenuTile(
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    icon: Iconsax.image,
                    trailing: Switch(value: false, onChanged: (value){},),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                      child: OutlinedButton(onPressed: ()=>AuthenticationRepository.instance.logOut(), child: const Text('Logout'),),),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
