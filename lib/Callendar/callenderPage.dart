// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/HomePage/class/lowerfab.dart';
import 'package:project/HomePage/widgets/bnb.dart';
import 'package:project/HomePage/widgets/fab.dart';
import 'package:project/Main%20Widgets/appbar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      floatingActionButton: FAB(),
      floatingActionButtonLocation: LowerCenterFabLocation(context),
      bottomNavigationBar: CustomBottomNavigationBar(isHome: false, context2: context),
    );
  }
}