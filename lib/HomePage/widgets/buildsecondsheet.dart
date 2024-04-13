// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/HomePage/Pages/page1edit.dart';
import 'package:project/HomePage/Pages/page2edit.dart';
import 'package:project/HomePage/widgets/homebutton.dart';

class SecondSheetPage extends StatefulWidget {
  const SecondSheetPage({super.key});

  @override
  _SecondSheetPageState createState() => _SecondSheetPageState();
}

class _SecondSheetPageState extends State<SecondSheetPage> {
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
                  EditPage1(),
                  EditPage2(),
                ],
              ),
            ),
          ],
        ),
        CustomHomeButton(
          text: isFirst ? 'Continue':'Edit',
          onPressed: () => nextPage(),
          width: MediaQuery.sizeOf(context).width*0.39,
          height: MediaQuery.sizeOf(context).height*0.076,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height*0.03,)
      ],
    );
  }
}

