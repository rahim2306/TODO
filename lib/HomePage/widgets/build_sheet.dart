// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/HomePage/Pages/page1.dart';
import 'package:project/HomePage/Pages/page2.dart';
import 'package:project/HomePage/widgets/cancelbutton.dart';
import 'package:project/HomePage/widgets/homebutton.dart';

class SheetPage extends StatefulWidget {
  const SheetPage({super.key});

  @override
  _SheetPageState createState() => _SheetPageState();
}

class _SheetPageState extends State<SheetPage> {
  final PageController _pageController = PageController(initialPage: 0);
  bool isFirst = true;
  
  void nextPage() {
    if (_pageController.page! < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        isFirst = false; 
      });
    } else if(_pageController.page! >= 1){
      Navigator.of(context).pop();
    }
  }

  void previousPage() {
    if (_pageController.page! > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height*0.55,
              decoration: const BoxDecoration(
                color: Color(0xfff7f7f7),
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: <Widget>[
                  Page1(),
                  Page2(),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCancelButton(
              text: 'Cancel',
              onPressed: () => Navigator.of(context).pop(),
              width: MediaQuery.sizeOf(context).width*0.39,
              height: MediaQuery.sizeOf(context).height*0.076,
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width*0.03),
            CustomHomeButton(
              text: isFirst ? 'Continue' : 'Confirm',
              onPressed: () => nextPage(),
              width: MediaQuery.sizeOf(context).width*0.39,
              height: MediaQuery.sizeOf(context).height*0.076,
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height*0.03,)
      ],
    );
  }
}

