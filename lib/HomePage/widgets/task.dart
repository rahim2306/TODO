// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/HomePage/widgets/buildsecondsheet.dart';
import 'package:project/HomePage/widgets/percentindicator.dart';

class TodoTask extends StatefulWidget {
  final String title;
  final DateTime time;
  final bool hasPB;

  const TodoTask({
    super.key,
    required this.title,
    required this.time,
    required this.hasPB
  });

  @override
  _TodoTaskState createState() => _TodoTaskState();
}

class _TodoTaskState extends State<TodoTask> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            CustomSlidableAction(
              onPressed: (context) => {},
              autoClose: true,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(20),
              padding : const EdgeInsets.symmetric(horizontal: 8),
              child: const Icon(Icons.delete),
            )
          ],
        ),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.25,
          children: [
            CustomSlidableAction(
              onPressed: (context) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40)
                    )
                  ),
                  builder: (BuildContext context) => SecondSheetPage(),
                );
              },
              autoClose: true,
              backgroundColor: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20),
              padding : EdgeInsets.symmetric(horizontal:8),
              child: const Icon(Icons.edit),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300), // Adjust duration as needed
            curve: Curves.easeInOut, // Adjust curve as needed
            height: _expanded ? MediaQuery.of(context).size.height * 0.22 : MediaQuery.of(context).size.height * 0.07,
            child: _buildTaskItem(context),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskItem(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 1, color: const Color(0xffAAAAAA)),
    ),
    child: _expanded
        ? SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    leading: Image.asset(
                      'assets/images/todo_icon.png',
                      width: (MediaQuery.of(context).size.height * 0.07) * 0.625,
                    ),
                    title: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      _formatTime(widget.time),
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: const Color(0x60000000),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: (MediaQuery.sizeOf(context).height*0.09),
                        width: MediaQuery.sizeOf(context).width*0.54,
                        decoration: BoxDecoration(
                          color: Color(0xffd7d7d7),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6),
                          child: SingleChildScrollView(
                            child: Text(
                              'This Task involves making a project abut a todo app and blah blah blah blah blah blah blah blah blahblah blah blah blah blah blahblah blah blah blah blah blah blah blah blah blah blah blah blah blah blah',
                              style: GoogleFonts.spaceGrotesk(
                                fontWeight: FontWeight.w200,
                                fontSize: 12
                              )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                      Container(
                        height: (MediaQuery.sizeOf(context).height*0.09),
                        width: MediaQuery.sizeOf(context).width*0.27,
                        decoration: BoxDecoration(
                          color: Color(0xffd7d7d7),
                          borderRadius: BorderRadius.circular(6)
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 39,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PercentageIndicator(),
                        SizedBox(width: 10,),
                        Container(
                          width: 100,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xff557BB5),
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Center(
                            child: Text(
                              'Completed',
                              style: GoogleFonts.spaceGrotesk(
                                color: const Color(0xfff7f7f7),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Image.asset(
                'assets/images/todo_icon.png',
                width: (MediaQuery.of(context).size.height * 0.07) * 0.625,
              ),
              title: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                _formatTime(widget.time),
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: const Color(0x60000000),
                ),
              ),
            ),
    );
  }


  String _formatTime(DateTime time) {
    String hour = time.hour.toString().padLeft(2, '0');
    String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
