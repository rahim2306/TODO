// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  
  TimeOfDay? _reminder;
  late TimeOfDay _time;
  DateTime _date = DateTime.now();
  bool progressionBarEnabled = false;
  bool setCategory = false;
  bool setPriority = false;

  final _timePickerTheme = TimePickerThemeData(
    dialTextStyle: GoogleFonts.spaceGrotesk(
      color: Colors.black
    ),
    backgroundColor: Color(0xfff7f7f7),
    hourMinuteShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Color(0xff557BB5), width: 4),
    ),
    dayPeriodBorderSide: const BorderSide(color: Color(0xff557BB5), width: 4),
    dayPeriodColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? Color.fromARGB(255, 110, 151, 212):Colors.white),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    dayPeriodTextColor: Color(0xff010101),
    dayPeriodShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Color(0xff557BB5), width: 4),
    ),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? Color.fromARGB(255, 110, 151, 212):Colors.white),
    hourMinuteTextColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected) ? Colors.white : Color(0xff557BB5)),
    dialHandColor: Colors.blueGrey.shade700,
    dialBackgroundColor: Color.fromARGB(255, 110, 151, 212),
    hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    helpTextStyle:
        GoogleFonts.spaceGrotesk(
          fontSize: 24, 
          fontWeight: FontWeight.bold, 
          color: Color(0xff557BB5)
        ),
    dialTextColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected) ? Color.fromARGB(255, 100, 145, 213): Colors.white),
    elevation: 3,
  );

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromARGB(255, 130, 153, 188), 
              onPrimary: Colors.black, // header text color
              onSurface: Color(0xff557BB5), // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xff557BB5), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      setState(() {
        _date = value!;
      });
    });
    print(_date);
  }

   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.017),
              Center(
                child: Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: const Color(0xff557BB5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.028),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Add Some Details',
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
                  width: MediaQuery.of(context).size.width * 0.96,
                  decoration: BoxDecoration(
                    color: const Color(0xff557BB5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.spaceGrotesk(
                            color: const Color(0xff557BB5),
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                        GestureDetector(
                          onTap: _showDatePicker,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: '...',
                                hintStyle: GoogleFonts.spaceGrotesk(
                                    color: const Color(0xff557BB5), fontSize: 18),
                                filled: true,
                                fillColor: const Color(0xffE7E7E7),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: const Color(0xff557BB5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.spaceGrotesk(
                            color: const Color(0xff557BB5),
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialEntryMode: TimePickerEntryMode.dialOnly,
                              initialTime: TimeOfDay.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    timePickerTheme: _timePickerTheme,
                                    textButtonTheme: TextButtonThemeData(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff557BB5)),
                                        foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                        overlayColor: MaterialStateColor.resolveWith((states) => Color(0xff557BB5)),
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if(time != null){
                              setState(() {
                                _time = time;
                              });
                            }
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: '...',
                                hintStyle: GoogleFonts.spaceGrotesk(
                                    color: const Color(0xff557BB5), fontSize: 18),
                                filled: true,
                                fillColor: const Color(0xffE7E7E7),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: Icon(
                                  Icons.timer_outlined,
                                  color: const Color(0xff557BB5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.local_offer_outlined,
                            color: const Color(0xff557BB5),
                            size: 28,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Category',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.spaceGrotesk(
                              color: const Color(0xff557BB5),
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => {
                            setState(() {
                              setCategory = true;
                            })
                          },
                          child: Container(
                            width: 91,
                            height: 33,
                            decoration: BoxDecoration(
                              color: const Color(0xff557BB5),
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: Center(
                              child: Text(
                                'Set',
                                style: GoogleFonts.spaceGrotesk(
                                  color: const Color(0xfff7f7f7),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.13),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.flag_outlined,
                            color: const Color(0xff557BB5),
                            size: 28,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Priority',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.spaceGrotesk(
                              color: const Color(0xff557BB5),
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              setPriority = true;
                            });
                          },
                          child: Container(
                            width: 91,
                            height: 33,
                            decoration: BoxDecoration(
                              color: const Color(0xff557BB5),
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: Center(
                              child: Text(
                                'Set',
                                style: GoogleFonts.spaceGrotesk(
                                  color: const Color(0xfff7f7f7),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Progression Bar',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.spaceGrotesk(
                      color: const Color(0xff557BB5),
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(width: 80), // Add spacing between text and switch
                  Switch(
                      value: progressionBarEnabled,
                      onChanged: (value) {
                        setState(() {
                          progressionBarEnabled = value;
                        });
                      },
                      activeColor: const Color(0xff557BB5),
                      inactiveThumbColor: Color(0xff698BBD),
                      inactiveTrackColor: Color(0xffffffff),
                    ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reminder',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.spaceGrotesk(
                      color: const Color(0xff557BB5),
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width*0.31), 
                  GestureDetector(
                    onTap: () async {
                      final TimeOfDay? reminder = await showTimePicker(
                        context: context,
                        initialEntryMode: TimePickerEntryMode.dialOnly,
                        initialTime: TimeOfDay.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              timePickerTheme: _timePickerTheme,
                              textButtonTheme: TextButtonThemeData(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff557BB5)),
                                  foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                  overlayColor: MaterialStateColor.resolveWith((states) => Color(0xff557BB5)),
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if(reminder != null){
                        setState(() {
                          _reminder = reminder;
                        });
                      }
                    },
                    child: Container(
                      width: 91,
                      height: 33,
                      decoration: BoxDecoration(
                        color: const Color(0xff557BB5),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          Icon(
                            Icons.notification_add_outlined,
                            color: Colors.white,
                            applyTextScaling: true,
                            weight: 8,
                            size: 25,
                          ),
                          Text(
                            'Add',
                            style: GoogleFonts.spaceGrotesk(
                              color: const Color(0xfff7f7f7),
                              fontSize: 20,
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),    
                ],
              ),
            ],
          ),
          
          if(setCategory) 
            Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.1,),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.40,
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    decoration: BoxDecoration(
                      color: Color(0xd7e7e7e7),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [ 
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), 
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 25.0,left:25.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        setCategory = false;
                                      })
                                    },
                                    child: Container(
                                      height: MediaQuery.sizeOf(context).width*0.2,
                                      width: MediaQuery.sizeOf(context).width*0.2,
                                      decoration: BoxDecoration(
                                        color: Color(0xffd7d7d7),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [ 
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2), 
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ]
                                      ),
                                      child: Icon(
                                        Icons.school_rounded,
                                        color: Color(0xff557BB5),
                                        size: 40,
                                      )
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    'School',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Color.fromARGB(255, 47, 67, 98),
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 25.0,left:25.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        setCategory = false;
                                      })
                                    },
                                    child: Container(
                                    height: MediaQuery.sizeOf(context).width*0.2,
                                    width: MediaQuery.sizeOf(context).width*0.2,
                                    decoration: BoxDecoration(
                                      color: Color(0xffd7d7d7),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [ 
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2), 
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ]
                                    ),
                                    child: Icon(
                                      Icons.work_rounded,
                                      color: Color(0xff557BB5),
                                      size: 40,
                                    )
                                  ),
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    'Work',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Color.fromARGB(255, 47, 67, 98),
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0,right: 25.0,left:25.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        setCategory = false;
                                      })
                                    },
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).width*0.2,
                                    width: MediaQuery.sizeOf(context).width*0.2,
                                    decoration: BoxDecoration(
                                      color: Color(0xffd7d7d7),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [ 
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2), 
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ]
                                    ),
                                    child: Icon(
                                      Icons.person_2_rounded,
                                      color: Color(0xff557BB5),
                                      size: 40,
                                    )
                                  ),
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    'Personal',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Color.fromARGB(255, 47, 67, 98),
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0,right: 25.0,left:25.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        setCategory = false;
                                      })
                                    },
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).width*0.2,
                                    width: MediaQuery.sizeOf(context).width*0.2,
                                    decoration: BoxDecoration(
                                      color: Color(0xffd7d7d7),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [ 
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2), 
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ]
                                    ),
                                    child: Icon(
                                      Icons.healing_outlined,
                                      color: Color(0xff557BB5),
                                      size: 40,
                                    )
                                  ),
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    'Health',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Color.fromARGB(255, 47, 67, 98),
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )

                      ], 
                    ),
                  ),
                ],
              ),
            ),
            if(setPriority) 
            Center(
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.49,
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    decoration: BoxDecoration(
                      color: Color(0xd7e7e7e7),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [ 
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), 
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 25.0,left:25.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        setPriority = false;
                                      })
                                    },
                                    child: Container(
                                      height: MediaQuery.sizeOf(context).width*0.2,
                                      width: MediaQuery.sizeOf(context).width*0.2,
                                      decoration: BoxDecoration(
                                        color: Color(0xffd7d7d7),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [ 
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2), 
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ]
                                      ),
                                      child: Icon(
                                        Icons.flag_outlined,
                                        color: Color(0xff557BB5),
                                        size: 40,
                                      )
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    '1',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Color.fromARGB(255, 47, 67, 98),
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 25.0,left:25.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        setPriority = false;
                                      })
                                    },
                                    child: Container(
                                    height: MediaQuery.sizeOf(context).width*0.2,
                                    width: MediaQuery.sizeOf(context).width*0.2,
                                    decoration: BoxDecoration(
                                      color: Color(0xffd7d7d7),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [ 
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2), 
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ]
                                    ),
                                    child: Icon(
                                      Icons.flag_outlined,
                                      color: Color(0xff557BB5),
                                      size: 40,
                                    )
                                  ),
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    '2',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Color.fromARGB(255, 47, 67, 98),
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0,right: 25.0,left:25.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        setPriority = false;
                                      })
                                    },
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).width*0.2,
                                    width: MediaQuery.sizeOf(context).width*0.2,
                                    decoration: BoxDecoration(
                                      color: Color(0xffd7d7d7),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [ 
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2), 
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ]
                                    ),
                                    child: Icon(
                                      Icons.flag_outlined,
                                      color: Color(0xff557BB5),
                                      size: 40,
                                    )
                                  ),
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    '3',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Color.fromARGB(255, 47, 67, 98),
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0,right: 25.0,left:25.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        setPriority = false;
                                      })
                                    },
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).width*0.2,
                                    width: MediaQuery.sizeOf(context).width*0.2,
                                    decoration: BoxDecoration(
                                      color: Color(0xffd7d7d7),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [ 
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2), 
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ]
                                    ),
                                    child: Icon(
                                      Icons.flag_outlined,
                                      color: Color(0xff557BB5),
                                      size: 40,
                                    )
                                  ),
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    '4',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Color.fromARGB(255, 47, 67, 98),
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0,left:25.0),
                          child: GestureDetector(
                            onTap: () => {
                              setState(() {
                                setPriority = false;
                              })
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).width*0.2,
                              width: MediaQuery.sizeOf(context).width*0.2,
                              decoration: BoxDecoration(
                                color: Color(0xffd7d7d7),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [ 
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2), 
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]
                              ),
                              child: Icon(
                                Icons.flag_outlined,
                                color: Color(0xff557BB5),
                                size: 40,
                              )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7.0),
                          child: Text(
                            '5',
                            style: GoogleFonts.spaceGrotesk(
                              color: Color.fromARGB(255, 47, 67, 98),
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        )
                      ], 
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}