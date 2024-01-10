import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';

class TSettingMenuTile extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  const TSettingMenuTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: TColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}