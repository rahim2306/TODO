// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/images/Ellipse3.png',
              width: MediaQuery.sizeOf(context).width,
              )
            ),
          ),
          Positioned(
            bottom: 0,
            child: Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/images/Ellipse2.png',
              width: MediaQuery.sizeOf(context).width,
              ), 
            ),
          ),
          Positioned(
            bottom : 0,
            child: Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/images/Ellipse1.png',
              width: MediaQuery.sizeOf(context).width,
              ), 
            ),
          ),
        ],
    );
  }
}
