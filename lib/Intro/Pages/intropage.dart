// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Intro/widgets/introbutton.dart';



class IntroPage extends StatefulWidget {

  final PageController controller;

  const IntroPage({super.key, required this.controller});

  @override
  State<IntroPage> createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFDCDEE3), Color(0xffA2BFEA)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Image.asset('assets/images/logo.png'),
                ),
              ],
            ),
            Spacer(),
            //!illustration
            Center(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width*0.820,
                height: MediaQuery.sizeOf(context).height*0.310,
                child: Image.asset(
                  'assets/images/Illustration.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height:30
            ),
            //!Text
            Text(
              "Welcome to Do it",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xFF37474F),
              )
            ),
            Text(
              "Do It, will help you to stay\norganized and preform your\ntasks much faster.",
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(
                color: Color(0xFF37474F),
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 15,),
            CustomButton(
              key: UniqueKey(),
              onPressed: () {
                widget.controller.animateToPage(3,duration: Duration(milliseconds: 500), curve: Curves.easeInOutExpo, );
              },
              text: 'Login',
              width: MediaQuery.sizeOf(context).width * 0.6, 
              height: (MediaQuery.sizeOf(context).width * 0.51)/3.085, 
              colors: [Color.fromARGB(255, 112, 157, 224), Color.fromARGB(255, 77, 118, 185)],
            ),
            SizedBox(height: 10,),
            CustomButton(
              key: UniqueKey(),
              onPressed: () {
                widget.controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOutExpo);
              },
              colors: [Color.fromARGB(255, 121, 151, 195), Color.fromARGB(255, 90, 112, 148)],
              text: 'SignUp',
              width: MediaQuery.sizeOf(context).width * 0.6, 
              height: (MediaQuery.sizeOf(context).width * 0.51)/3.085, 
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}