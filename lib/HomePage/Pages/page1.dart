import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*0.017,),
            Center(
              child: Container(
                height: 4,
                width: MediaQuery.sizeOf(context).width*0.3,
                decoration: BoxDecoration(
                  color: const Color(0xff557BB5),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.028,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Create New Task',
                textAlign: TextAlign.left,
                style: GoogleFonts.spaceGrotesk(
                  color: const Color(0xff557BB5),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Center(
              child: Container(
                height: 1,
                width: MediaQuery.sizeOf(context).width*0.96,
                decoration: BoxDecoration(
                  color: const Color(0xff557BB5),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
            const SizedBox(height: 23,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Task Title',
                textAlign: TextAlign.left,
                style: GoogleFonts.spaceGrotesk(
                  color: const Color(0xff557BB5),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Add Task Name',
                  hintStyle: GoogleFonts.spaceGrotesk(
                    color: const Color(0xff557BB5)
                  ),  
                  filled: true,
                  fillColor: const Color(0xffE7E7E7), 
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),  
                    border: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none, 
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10),
              child: Text(
                'Description',
                textAlign: TextAlign.left,
                style: GoogleFonts.spaceGrotesk(
                  color: const Color(0xff557BB5),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Add Description...',
                  hintStyle: GoogleFonts.spaceGrotesk(
                    color: const Color(0xff557BB5),
                  ),  
                  filled: true,
                  fillColor: const Color(0xffE7E7E7), 
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  border: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none, 
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    'Related Documents',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.spaceGrotesk(
                      color: const Color(0xff557BB5),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width*0.25,),
                  GestureDetector(
                    onTap: () => (),
                    child: Container(
                      width: 80,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xff557BB5),
                        borderRadius: BorderRadius.circular(200)
                      ),
                      child: Center(
                        child: Text(
                          'Browse',
                          style: GoogleFonts.spaceGrotesk(
                            color: const Color(0xfff7f7f7)
                          ),
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  color: const Color(0xffe7e7e7),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            )
          ],
        ),
      );
  }
}