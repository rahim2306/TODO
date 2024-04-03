import 'package:flutter/material.dart';

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  final double topMargin;
  final double horizontalMargin;

  const CustomFloatingActionButtonLocation(this.topMargin, this.horizontalMargin);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double halfWidth = scaffoldGeometry.scaffoldSize.width / 2.0;
    final double fabHalfWidth = scaffoldGeometry.floatingActionButtonSize.width / 2.0;
    return Offset(
      halfWidth - fabHalfWidth + horizontalMargin, // Adjust horizontal offset
      -topMargin, // Adjust vertical offset
    );
  }

  @override
  String toString() => 'CustomFloatingActionButtonLocation';
}
