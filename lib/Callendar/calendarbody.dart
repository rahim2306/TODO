// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project/HomePage/widgets/task.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:project/HomePage/widgets/dbd.dart';

class CalenderBody extends StatefulWidget {
  final ScrollController scrollController;

  const CalenderBody({super.key, required this.scrollController});

  @override
  State<CalenderBody> createState() => _CalenderBodyState();
}

class _CalenderBodyState extends State<CalenderBody> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;


  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(_focusedDay);
    return  Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFDCDEE3), Color(0xffA2BFEA)],
        ),
      ),
      child: CustomScrollView(
        controller: widget.scrollController,
        slivers: [
          SliverAppBar(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,    
            shadowColor: Color(0xff000000),
            expandedHeight: MediaQuery.sizeOf(context).height*0.49,
            collapsedHeight: MediaQuery.sizeOf(context).height*0.1,
            pinned: true,
            stretch: true,
            backgroundColor: Color(0xFFDCDEE3),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60)
              )
            ),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.1,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '$formattedDate\'s tasks',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.spaceGrotesk(
                        color: Color(0xff557BB5),
                        fontWeight: FontWeight.w500,
                        fontSize: 26
                      ),
                    ),
                  ),
                  CustomDropDownButton(size: 40),
                ],
              ),
              
              titlePadding: EdgeInsets.symmetric(horizontal: 20.0),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: Container(
                height: MediaQuery.sizeOf(context).height*0,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDEE3),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TableCalendar(
                    weekendDays: [DateTime.friday, DateTime.saturday],
                    rowHeight: MediaQuery.sizeOf(context).height*0.055,
                    focusedDay: _focusedDay,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      headerPadding: EdgeInsets.only(top: 2),
                      titleTextStyle: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff557BB5),
                        fontSize: 28,
                      ),
                    ),
                    daysOfWeekHeight: 37,
                    firstDay: DateTime.utc(2024, 1, 1),
                    lastDay: DateTime.utc(2025, 1, 1),
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                      outsideTextStyle: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Color.fromARGB(255, 68, 73, 102).withOpacity(0.5),
                      ),
                      weekendTextStyle: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.black.withOpacity(0.5),
                      )
                    ),
                    calendarBuilders: CalendarBuilders(
                      selectedBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xff557BB5),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          date.day.toString(),
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: const Color(0xfff7f7f7),
                          ),
                        ),
                      ),
                      dowBuilder: (context, day) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  DateFormat.E().format(day).toUpperCase(), 
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Divider(
                                thickness: 1,
                                height: 1,
                                indent: DateFormat.E().format(day) == "Fri" ? 10 : 0,
                                endIndent: DateFormat.E().format(day) == "Thu" ? 10 : 0,
                              )
                            ],
                          ),
                        );
                      },
                      todayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff557BB5),Color.fromARGB(255, 55, 76, 107) ]
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Text(
                          date.day.toString(),
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: const Color(0xfff7f7f7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ),
          ),
          SliverList(
            key: Key('UniqueKey'),
            delegate: SliverChildListDelegate(
              [
                for(var i = 0; i < 7 ; i++)
                  TodoTask(
                    title: 'Title $i',
                    time: DateTime.now().add(Duration(hours: 1)),
                    hasPB: i.isEven ? true : false,
                  ),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.153,)
              ]
            ),
          ),
        ],
      ),
    );
  }
}