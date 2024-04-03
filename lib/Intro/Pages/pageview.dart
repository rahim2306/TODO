// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/Intro/Pages/intro_page.dart';
import 'package:project/Intro/Pages/loginsignupscreen.dart';
import 'package:project/Intro/Pages/name_question.dart';

class MyPageView extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Intro(controller: controller),
          NameQuestion(controller: controller),
          LoginSignUpScreen(controller: controller ,currentPage: 1)
        ],
      ),
    );
  }
}