// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PercentageIndicator extends StatefulWidget {
  @override
  _PercentageIndicatorState createState() => _PercentageIndicatorState();
}

class _PercentageIndicatorState extends State<PercentageIndicator> {
  double _percentage = 0;
  
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width * 0.45;
    double draggableWidth = 24;
    double borderWidth = 4;

    return Row(
      children: [
        Text(
          '${_percentage.round()}%',
          textAlign: TextAlign.left,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 7,),
        SizedBox(
          width: totalWidth,
          height: 24,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff557BB5), width: borderWidth),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Container(
                          width: _percentage * (totalWidth - 2 * borderWidth) / 100,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color(0xff557BB5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: ((_percentage ) / 100) * (totalWidth - draggableWidth - 2 * borderWidth), // Adjusted to consider padding and border width
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      double newPosition = ((_percentage + details.primaryDelta! / (totalWidth - draggableWidth - borderWidth) * 100)).clamp(0, 100); // Calculate the new position and ensure it's within bounds
                      _percentage = newPosition;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5), // Adjusted to consider border width
                    child: Container(
                      width: 12,
                      height: 24,
                      decoration: BoxDecoration(
                        color:Color(0xff557BB5) ,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
