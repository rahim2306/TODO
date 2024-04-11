// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Intro/widgets/footer_widget.dart';
import 'package:project/Intro/widgets/introbutton.dart';

class Intro extends StatelessWidget {

  final PageController controller;

  const Intro({super.key, required this.controller});
  
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
          //! Button
          Positioned(
            bottom: MediaQuery.sizeOf(context).height*0.070,
            left: MediaQuery.sizeOf(context).width*0.233,
            child: CustomButton(
              key: UniqueKey(),
              onPressed: () {
              controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
              colors: [Color.fromARGB(255, 112, 157, 224), Color.fromARGB(255, 77, 118, 185)],
              text: 'Continue',
              width: MediaQuery.sizeOf(context).width * 0.53, 
              height: (MediaQuery.sizeOf(context).width * 0.54)/3.085, 
            ),
          ),
          //! illustration And Text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              SizedBox(
                height:27
              ),
            ],
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
