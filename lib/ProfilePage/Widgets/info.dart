// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatelessWidget {

  final String title;
  final String? content;
  const Info({super.key, required this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              color: Color(0xff455E86),
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            content!,
            style: GoogleFonts.spaceGrotesk(
              color: Color(0xff455E86),
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    );
  }
}