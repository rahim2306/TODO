// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/Callendar/callenderpage.dart';
import 'package:project/HomePage/homepage.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final bool isHome;
  final BuildContext context2;
  const CustomBottomNavigationBar({
    super.key,
    required this.isHome,
    required this.context2
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
          height: MediaQuery.sizeOf(context).height*0.156,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x00f7f7f7), Color.fromARGB(255, 0, 56, 210)],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height*0.156,
            child: Image.asset(
              'assets/images/bnb.png', 
              fit: BoxFit.fitWidth, 
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height *.017,
          left: MediaQuery.sizeOf(context).width *.15,
          child: GestureDetector(
            onTap: () {
              if(!isHome)
              {Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TodoHomePage()),
              );}
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height *.075,
              width: MediaQuery.sizeOf(context).height *.075,
              decoration: BoxDecoration(
                color: isHome ? Color(0xfff2f2f2) : Colors.transparent,
                borderRadius: BorderRadius.circular(60),
                boxShadow: isHome
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2, 
                          blurRadius: 2, 
                          offset: Offset(0, 2), 
                        ),
                      ]
                    : null, 
              ),
              child: Image(
                image: AssetImage(
                  'assets/images/home.png',
                ),
              )
            ),
          )
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.017,
          right: MediaQuery.sizeOf(context).width * 0.15,
          child: GestureDetector(
            onTap: () {
              if(isHome)
              {Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );}
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.075,
              width: MediaQuery.sizeOf(context).height * 0.075,
              decoration: BoxDecoration(
                color: !isHome ? Color(0xfff2f2f2) : Colors.transparent,
                borderRadius: BorderRadius.circular(60),
                boxShadow: !isHome
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                          spreadRadius: 2, // Spread radius
                          blurRadius: 2, // Blur radius
                          offset: Offset(0, 2), // Offset in the y direction (downward)
                        ),
                      ]
                    : null, 
              ),
              child: Image(
                image: AssetImage(
                  'assets/images/calendar.png',
                ),
              ),
            ),
          ),
        ),
      ]
    );
  }
}
