
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget {
  final String hintText;

  const InputField({super.key, required this.hintText});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height*0.082,
      width: MediaQuery.sizeOf(context).width*0.87,
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top:12, bottom:12, left:27),
          hintText: widget.hintText, // Use the hint text parameter
          hintStyle: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0x50557BB5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide( 
              color: Color(0xFF557BB5), 
              width: 4.0, 
            ),
          ),
          enabledBorder: OutlineInputBorder( 
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xFF557BB5), 
              width: 3.4, 
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xFF557BB5), 
              width: 3.4, 
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
