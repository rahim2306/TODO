// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomSlideAction extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color color;
  final String caption;

  const CustomSlideAction({super.key, 
    required this.child,
    required this.onTap,
    required this.color,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: color,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              caption,
              style: TextStyle(color: Colors.white),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
