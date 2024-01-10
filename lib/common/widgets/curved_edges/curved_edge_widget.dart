import 'package:flutter/material.dart';

import 'curved_edges.dart';


class TCurvedEdgeWidget extends StatelessWidget {
  final Widget? child;
  const TCurvedEdgeWidget({

    super.key, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCurvedEdges(),
      child: child,
    );
  }
}