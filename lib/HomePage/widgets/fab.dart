// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/HomePage/widgets/build_sheet.dart';

class FAB extends StatelessWidget {
  const FAB({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height *.09,
        width: MediaQuery.sizeOf(context).height *.09,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40)
                )
              ),
              builder: (BuildContext context) => SheetPage(),
            );
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          elevation: 3,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffA8C2E9),
                  Color(0xff789DD6),
                ],
              ),
            ),
            child: Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.08,
            ),
          ),
        ),
      );
  }
}