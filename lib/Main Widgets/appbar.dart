// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: Color(0xFFDCDEE3),
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

   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
