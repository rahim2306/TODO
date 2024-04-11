// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/HomePage/homepage.dart';
import 'package:project/Intro/widgets/Page%20Widgets/login.dart';
import 'package:project/Intro/widgets/introbutton.dart';

class Login extends StatefulWidget {

  final PageController controller;

  const Login({super.key, required this.controller});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              SizedBox(height: MediaQuery.sizeOf(context).height*0.06,),
              Center(
                child: Container(
                  width: 360,
                  height: MediaQuery.of(context).size.height * 0.5 ,
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
                      LoginPage(controller: widget.controller,),
                      SizedBox(height: 15,),
                      CustomButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => TodoHomePage()),
                        );
                        },
                        colors: [Color.fromARGB(255, 112, 157, 224), Color.fromARGB(255, 77, 118, 185)],
                        text: "Login",
                        width: MediaQuery.of(context).size.width * 0.53,
                        height: (MediaQuery.of(context).size.width * 0.54) / 3.085,
                      ),
                    ],
                  ),
                )
              ),
              Text(
                "Don’t Have an Account?",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 16,
                  color: Color(0xFF214275),
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOutExpo);
                },
                child: Text(
                  "SignUp" ,
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