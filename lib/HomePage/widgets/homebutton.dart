// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHomeButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  final double width;
  final double height;

  const CustomHomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
  });

  @override
  _CustomHomeButtonState createState() => _CustomHomeButtonState();
}

class _CustomHomeButtonState extends State<CustomHomeButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Material(
        elevation: 3, 
        shadowColor: Color(0xF55570B5),
        borderRadius: BorderRadius.circular(25),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 112, 157, 224), Color.fromARGB(255, 77, 118, 185)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(25), 
          ),
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(40),
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                ), 
              ),
            ),
          ),
        ),
      ),
    );
  }
}
