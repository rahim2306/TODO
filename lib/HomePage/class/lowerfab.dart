import 'package:flutter/material.dart';

class LowerCenterFabLocation extends FloatingActionButtonLocation {
  final BuildContext context;
  const LowerCenterFabLocation(this.context);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width - scaffoldGeometry.floatingActionButtonSize.width) / 2;
    final double fabY = MediaQuery.sizeOf(context).height *0.853; // Adjusted to lower the FAB
    return Offset(fabX, fabY);
  }
}
