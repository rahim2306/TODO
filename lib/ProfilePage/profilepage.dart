// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_nullable_for_final_variable_declarations, avoid_returning_null_for_void, prefer_final_fields, unused_import

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Intro/Pages/intro_page.dart';
import 'package:project/Intro/Pages/pageview.dart';
import 'package:project/ProfilePage/Widgets/info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>  {

  bool _isVisible = false;
  final String? _name = 'Abderrahim';
  final String email = 'Example@mail.com';
  final String password = 'Example@mail.com';
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFDCDEE3), Color(0xffA2BFEA)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(!isKeyBoard)Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: GoogleFonts.spaceGrotesk(
                          color: Color(0xff455E86).withOpacity(0.7),
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        '$_name',
                        style: GoogleFonts.spaceGrotesk(
                          color: Color(0xff455E86),
                          fontSize: 36,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: MediaQuery.sizeOf(context).height*0.04,
                    backgroundColor: Color(0xff455E86),
                    child: Icon(
                      Icons.account_circle,
                      size: (MediaQuery.sizeOf(context).height*0.04)*2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutExpo,
                height: _isVisible ? MediaQuery.sizeOf(context).height*0.06 : MediaQuery.sizeOf(context).height*0.1,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutExpo,
                height: !isKeyBoard ? MediaQuery.sizeOf(context).height*0.3 : MediaQuery.sizeOf(context).height*0.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xf9f9f9f9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ]
                ),
                child: !isKeyBoard ? 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Informations',
                          style: GoogleFonts.spaceGrotesk(
                            color: Color(0xff455E86),
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Spacer(),
                        Info(title: 'Name', content: '$_name',),
                        Spacer(),
                        DottedLine(dashGapLength: 3,dashLength: 9,),
                        Spacer(),
                        Info(title: 'Email', content: email,),
                        Spacer(),
                        DottedLine(dashGapLength: 3,dashLength: 9,),
                        Spacer(),
                        Info(title: 'Password', content: '********',),
                      ],
                    ),
                  )
                  :
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Informations',
                          style: GoogleFonts.spaceGrotesk(
                            color: Color(0xff455E86),
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ]
                    )
                  )
              ),
              SizedBox(height: 5,),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _isVisible = true;
                  })
                },
                child: Text(
                  'Change Password',
                  style: GoogleFonts.spaceGrotesk(
                    color: Color.fromARGB(255, 48, 66, 94),
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Old Password',
                        style: GoogleFonts.spaceGrotesk(
                          color: Color(0xff455E86),
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200], 
                        hintText: 'Confirm Password', 
                        hintStyle: GoogleFonts.spaceGrotesk(
                          color: Color(0xff455E86).withOpacity(0.3),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ), 
                        border: OutlineInputBorder( 
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0), // Padding inside the text field
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Old Password',
                        style: GoogleFonts.spaceGrotesk(
                          color: Color(0xff455E86),
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _controller2,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffE7E7E7), 
                        hintText: 'New Password', 
                        hintStyle: GoogleFonts.spaceGrotesk(
                          color: Color(0xff455E86).withOpacity(0.3),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ), 
                        border: OutlineInputBorder( 
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => {
                          setState(() {
                            _isVisible = false;
                          })
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xfff7f7f7), 
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), 
                          ),
                          elevation: 2, 
                        ),
                        child: Text(
                          'Change',
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff455E86),
                            fontSize: 16
                          )
                        ),
                      ),
                    )
                  ]
                )
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutExpo,
                height: !_isVisible ? MediaQuery.sizeOf(context).height*0 : MediaQuery.sizeOf(context).height*0.02,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyPageView()),
                      );
                    })
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 225, 26, 26), 
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), 
                    ),
                    elevation: 2, 
                  ),
                  child: Text(
                    'LogOut',
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.normal,
                      color: Color(0xfff7f7f7),
                      fontSize: 25
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}