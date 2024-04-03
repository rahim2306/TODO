// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Intro/widgets/logininputfield.dart';



class SignUpPage extends StatelessWidget {
  final PageController controller;

  const SignUpPage({super.key, required this.controller});
  
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
                width: 360,
                child: Stack(
                  children: [
                  Positioned(
                    bottom: 25,
                    right:MediaQuery.sizeOf(context).width*0.6010,
                    child: GestureDetector(
                      onTap: () {
                        controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                      },
                      child: Image.asset(
                        'assets/icons/back.png',
                        width: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 45,
                    left:MediaQuery.sizeOf(context).width*0.222,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "SignUp",
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF214275)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 33,
                    left:MediaQuery.sizeOf(context).width*0.198,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "Create your account",
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xA1214275)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                ),
              ),
              LoginInputField(
                hintText: 'Example@mail.com',
                text: 'Email',
                fontsize: 20,
                icon: AssetImage('assets/icons/Mail.png'),
                iconCanBeTapped: false,
              ),
              LoginInputField(
                hintText: '••••••••',
                text: 'Password',
                fontsize: 24,
                icon: AssetImage('assets/icons/openeye.png'),
                iconCanBeTapped: true,
                tappedIcon: AssetImage('assets/icons/eye.png'),
              ),
              LoginInputField(
                hintText: '••••••••',
                text: 'Confirm Password',
                fontsize: 24,
                icon: AssetImage('assets/icons/openeye.png'),
                iconCanBeTapped: true,
                tappedIcon: AssetImage('assets/icons/eye.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
