// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class PriorityMenuPopUp extends StatelessWidget {
  const PriorityMenuPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          color: Colors.blue[50]
        ),
        Container(
          height: 40,
          color: Colors.blue[100]
        ),
        Container(
          height: 40,
          color: Colors.blue[200]
        ),
      ],
    );
  }
}