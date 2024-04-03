// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom:0,
      left: 0,
      child: Stack(
        children: [
          Opacity(
          opacity: 1,
          child: Image.asset(
            'assets/images/Ellipse3.png',
            width: MediaQuery.sizeOf(context).width,
            )
          ),
          Opacity(
          opacity: 1,
          child: Image.asset(
            'assets/images/Ellipse2.png',
            width: MediaQuery.sizeOf(context).width,
            ), 
          ),
          Opacity(
          opacity: 1,
          child: Image.asset(
            'assets/images/Ellipse1.png',
            width: MediaQuery.sizeOf(context).width,
            ), 
          ),
        ],
      ),
    );
  }
}
