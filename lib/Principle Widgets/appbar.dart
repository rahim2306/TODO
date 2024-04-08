// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/ProfilePage/profilepage.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({super.key, required this.isWhite});
  
  final bool isWhite;

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: isWhite ? Color(0xFFDCDEE3) :Color(0xFFDCDEE3),
      elevation: 0,
      shadowColor: Color(0xFFDCDEE3),
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/images/HeaderLogo.png',
            width: MediaQuery.of(context).size.width * 0.36,
          ),
          Spacer(),
          _buildProfileButton(context),
        ],
      ),
    );
  }

  Widget _buildProfileButton(BuildContext context) {
    double height =  MediaQuery.sizeOf(context).height*0.05;
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      },
      icon: CircleAvatar(
          radius: height/2,
          backgroundColor: Color(0xff455E86),
          child: Icon(
            Icons.account_circle,
            size: height,
            color: Colors.white,
          ),
        ),
    );
  }

   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
