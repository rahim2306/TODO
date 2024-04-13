// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, unused_import, unused_field, unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/HomePage/homepage.dart';
import 'package:project/Intro/widgets/Page%20Widgets/login.dart';
import 'package:project/Intro/widgets/Page%20Widgets/signup.dart';
import 'package:project/Intro/widgets/introbutton.dart';

class SignUpScreen extends StatefulWidget {
  final int? currentPage;
  final PageController controller;

  const SignUpScreen({required this.controller, this.currentPage});
  
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFDCDEE3), Color(0xffA2BFEA)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
              Center(
                child: Container(
                  width: 360,
                  height: MediaQuery.of(context).size.height * 0.6 ,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignUpPage(controller: widget.controller,),
                      SizedBox(height: 15,),
                      CustomButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => TodoHomePage()),
                        );
                        },
                        colors: [Color.fromARGB(255, 112, 157, 224), Color.fromARGB(255, 77, 118, 185)],
                        text: "Create",
                        width: MediaQuery.of(context).size.width * 0.53,
                        height: (MediaQuery.of(context).size.width * 0.54) / 3.085,
                      ),
                    ],
                  ),
                )
              ),
              Text(
                "Already Have An Account?",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 16,
                  color: Color(0xFF214275),
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOutExpo);
                },
                child: Text(
                  "Login" ,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 16,
                    color: Color(0xFF5F90D9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
