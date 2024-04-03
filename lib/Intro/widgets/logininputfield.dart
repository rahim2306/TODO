
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginInputField extends StatefulWidget {
  final String hintText;
  final String text;
  final double? fontsize;
  final ImageProvider icon;
  final ImageProvider? tappedIcon; // Make tappedIcon nullable
  final bool iconCanBeTapped;

  const LoginInputField({
    super.key,
    required this.hintText,
    required this.text,
    required this.fontsize,
    required this.icon,
    this.tappedIcon,
    required this.iconCanBeTapped,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<LoginInputField> {
  TextEditingController _controller = TextEditingController();
  bool _obscureText = true;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8, 
      height: MediaQuery.sizeOf(context).height * 0.11,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              widget.text,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Color(0xFF557BB5),
              ),
            ),
          ),
          TextFormField(
            controller: _controller,
            obscureText: widget.text.toLowerCase().contains('password') ? _obscureText : false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.iconCanBeTapped
                ? Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isTapped = !_isTapped;
                          if (widget.text.toLowerCase().contains('password')) {
                            _obscureText = !_obscureText;
                          }
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        child: Center(
                          child: Image(
                            image: _isTapped ? widget.tappedIcon! : widget.icon,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                  )
                : Image(image: widget.icon),
              contentPadding: EdgeInsets.only(top: 3, bottom: 3, left: 16),
              hintStyle: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.w100,
                fontSize: widget.fontsize,
                color: Color(0x60000000),
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
                  width: 4.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Color(0xFF557BB5), 
                  width: 4.0, 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
