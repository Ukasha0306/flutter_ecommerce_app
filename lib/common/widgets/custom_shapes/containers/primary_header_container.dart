import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/curved_edges/curved_edge_widget.dart';
import '../../../../utils/constants/color.dart';
import 'circular_container.dart';


class TPrimaryHeaderContainer extends StatelessWidget {

  final Widget child;
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: TColors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: TColors.white.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}