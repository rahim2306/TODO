// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, unused_import, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/HomePage/homepage.dart';
import 'package:project/Intro/intro_page.dart';
import 'package:project/Intro/login.dart';
import 'package:project/Intro/signup.dart';
import 'package:project/widgets/app_input_field.dart';
import 'package:project/widgets/footer_widget.dart';
import 'package:project/widgets/introbutton.dart';

class LoginSignUpScreen extends StatefulWidget {
  final int? currentPage;
  final PageController controller;

  const LoginSignUpScreen({required this.controller, this.currentPage});
  
  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  int currentpage = 0; 
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentPage ?? 0); 
    currentpage = widget.currentPage ?? 0; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              width: 360,
              height: currentpage == 0 ? MediaQuery.of(context).size.height * 0.41 : MediaQuery.of(context).size.height * 0.465,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 5.6,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentpage = index;
                  });
                },
                children: [
                  LoginPage(controller: widget.controller,),
                  SignUpPage(controller: widget.controller,),
                ],
              ),
            ),
          ),
          //! Button
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.070,
            left: MediaQuery.of(context).size.width * 0.233,
            child: CustomButton(
              onPressed: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TodoHomePage()),
              );
              },
              text: currentpage == 0 ? "Create" : "Login",
              width: MediaQuery.of(context).size.width * 0.53,
              height: (MediaQuery.of(context).size.width * 0.54) / 3.085,
            ),
          ),
          SizedBox(height: 1.5),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.044, 
            left: currentpage == 0 ? MediaQuery.of(context).size.width * 0.267 : MediaQuery.of(context).size.width * 0.247,
            child: Text(
              currentpage == 0 ? "Don’t Have an Account?" : "Already Have an Account?",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                color: Color(0xFF214275),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: (MediaQuery.of(context).size.height * 0.042) - 12,
            left: MediaQuery.of(context).size.width * 0.429,
            child: GestureDetector(
              onTap: () {
                if (currentpage != 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut
                  );
                } else {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut
                  );
                }
              },
              child: Text(
                currentpage == 0 ? "SignUp" : "Login",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 16,
                  color: Color(0xFF5F90D9),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
        ],
      ),
    );
  }
}
