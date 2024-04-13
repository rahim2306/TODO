// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
import 'package:project/Callendar/calendarbody.dart';
import 'package:project/HomePage/class/lowerfab.dart';
import 'package:project/HomePage/widgets/bnb.dart';
import 'package:project/HomePage/widgets/fab.dart';
import 'package:project/Principle%20Widgets/appbar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: Hidable(
        
        controller: scrollController,
        preferredWidgetSize: Size.fromHeight(MediaQuery.sizeOf(context).height*0.11),
        child: BuildAppBar(isWhite: true,)
      ),
      body: CalenderBody(scrollController: scrollController),
      floatingActionButton: FAB(),
      floatingActionButtonLocation: LowerCenterFabLocation(context),
      bottomNavigationBar: CustomBottomNavigationBar(isHome: false, context2: context),
    );
  }
}