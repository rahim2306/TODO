// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project/Intro/Pages/loginsignupscreen.dart';
import 'package:project/Intro/widgets/app_input_field.dart';
import 'package:project/Intro/widgets/footer_widget.dart';
import 'package:project/Intro/widgets/introbutton.dart';

class NameQuestion extends StatelessWidget {

  final PageController controller;

  const NameQuestion({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFDCDEE3), Color(0xffA2BFEA)],
              ),
            ),
          ),
          AppFooter(),
          //! Button
          Positioned(
            bottom: MediaQuery.sizeOf(context).height*0.070,
            left: MediaQuery.sizeOf(context).width*0.233,
            child: CustomButton(
              onPressed: () {
              controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
              text: 'Continue',
              width: MediaQuery.sizeOf(context).width * 0.53, 
              height: (MediaQuery.sizeOf(context).width * 0.54)/3.085, 
            ),
          ),
          SizedBox(height: 1.5),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height*0.044,
            left: MediaQuery.sizeOf(context).width*0.243,
            child:Text(
              "Already Have an account ?",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                color: Color(0xFF214275),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: (MediaQuery.sizeOf(context).height*0.042)-12,
            left: MediaQuery.sizeOf(context).width*0.43,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSignUpScreen(controller: controller,currentPage: 0,)));
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 16,
                    color: Color(0xFF5F90D9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(48.0),
                child: Image.asset('assets/images/logo.png'),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left:24,right:24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:3),
                    child: Text(
                      'So, what\'s your name?',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF557BB5)
                        ),
                    ),
                  ), 
                  SizedBox(height: 1),
                  InputField(hintText: 'Name',),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}