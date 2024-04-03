// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCancelButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  final double width;
  final double height;

  const CustomCancelButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
  });

  @override
  _CustomCancelButtonState createState() => _CustomCancelButtonState();
}

class _CustomCancelButtonState extends State<CustomCancelButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Material(
        elevation: 0, 
        borderRadius: BorderRadius.circular(25),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfff7f7f7),
            borderRadius: BorderRadius.circular(25), 
            border: Border.all(color: Colors.black)
          ),
          child: InkWell(
            onTap: widget.onPressed,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.spaceGrotesk(
                  color: Color.fromARGB(255, 85, 85, 85),
                  fontWeight: FontWeight.w600,
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
