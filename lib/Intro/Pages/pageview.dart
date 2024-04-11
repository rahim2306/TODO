// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/Intro/Pages/intropage.dart';
import 'package:project/Intro/Pages/loginpage.dart';
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
          IntroPage(controller: controller),
          NameQuestion(controller: controller),
          SignUpScreen(controller: controller ,currentPage: 1),
          Login(controller: controller,),
        ],
      ),
    );
  }
}