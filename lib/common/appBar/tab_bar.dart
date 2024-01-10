import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/device/device_utility.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tab});
  final List<Widget> tab;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      child: TabBar(
        tabs: tab,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: dark ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
