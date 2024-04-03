// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/HomePage/class/lowerfab.dart';
import 'package:project/HomePage/widgets/bnb.dart';
import 'package:project/HomePage/widgets/build_sheet.dart';
import 'package:project/HomePage/widgets/categoryslide.dart';
import 'package:project/HomePage/widgets/dbd.dart';
import 'package:project/HomePage/widgets/task.dart';

class TodoHomePage extends StatefulWidget {

  const TodoHomePage({super.key});

  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  bool showCompletedTasks = false;
  final items = ['Sort By', 'Completed'];
  String selectedValue = 'Sort By';

  
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFDCDEE3),
      elevation: 0,
      shadowColor: Color(0xFFDCDEE3),
      toolbarHeight: MediaQuery.of(context).size.height * 0.09,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/images/HeaderLogo.png',
            width: MediaQuery.of(context).size.width * 0.36,
          ),
          Spacer(),
          _buildProfileButton(),
        ],
      ),
    );
  }

  Widget _buildProfileButton() {
    return IconButton(
      onPressed: () {
        // Navigate to profile page or show profile options
      },
      icon: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.transparent,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xff455E86),
          child: Icon(
            Icons.account_circle,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTaskListItem(String title, bool hasPB) {
    return TodoTask(
      title: title,
      time: DateTime.now().add(Duration(hours: 1)),
      hasPB: hasPB,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFDCDEE3), Color(0xffA2BFEA)],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 20.0,left:20,bottom: 10),
              child: Container(
                height: 130.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff557BB5),
                          blurRadius: 2.0,
                          offset: Offset(0.0, 2.0))
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 147, 182, 235),
                          Color(0xff557BB5),
                        ])),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Manage your\ntime well',
                        style: GoogleFonts.spaceGrotesk(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      Image.asset(
                        'assets/images/Vector2.png',
                        width: 90.0,
                        height: 80.0,
                      ),
                      Image.asset('assets/images/file.png'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10 ),
              child: CategroySlide()
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16,),
                Text(
                  'You Have 3 Tasks For Today',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xff557BB5)
                  ),
                ),
                SizedBox(width: MediaQuery.sizeOf(context).width*0.04,),
                CustomDropDownButton(),
              ],
            ),
            ListView(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              children: showCompletedTasks
                ? [
                    _buildTaskListItem('completedtaskNumber1',true),
                    _buildTaskListItem('completedtaskNumber2',true),
                  ]
                : [
                    _buildTaskListItem('read a book',true),
                    _buildTaskListItem('taskNumber2',true),
                    _buildTaskListItem('taskNumber2',true),
                    _buildTaskListItem('taskNumber2',true),
                    _buildTaskListItem('taskNumber2',true),
                    _buildTaskListItem('taskNumber2',true),
                  ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.155,),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: SizedBox(
        height: MediaQuery.sizeOf(context).height *.09,
        width: MediaQuery.sizeOf(context).height *.09,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40)
                )
              ),
              builder: (BuildContext context) => SheetPage(),
            );
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          elevation: 3,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffA8C2E9),
                  Color(0xff789DD6),
                ],
              ),
            ),
            child: Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.08,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: LowerCenterFabLocation(context),
      bottomNavigationBar: CustomBottomNavigationBar(isHome: true, context2: context,),
    );
  }
}
