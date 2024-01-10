import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  final String title;
  final bool smallSize;
  final int maxLine;
  final TextAlign? textAlign;
  const ProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLine = 2,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleSmall,
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}