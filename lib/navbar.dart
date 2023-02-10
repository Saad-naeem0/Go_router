import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<NavBar> createState() => _NavBarState();
}
 int selectedIndex = 0;

class _NavBarState extends State<NavBar> {
  void onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go('/setting');
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        rippleColor: Color(0xff232023),
        hoverColor: Color(0xff232023),
        gap: 10,
        activeColor: Colors.white,
        iconSize: 30,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Color(0xff232023),
        color: Colors.grey,
        tabs: [
          GButton(icon: Icons.lightbulb, text: 'Fact',onPressed: (){
            onItemTapped(0);

          },),
          GButton(icon: Icons.save_sharp, text: 'Secure Storage',onPressed: (){
            onItemTapped(1);

          },),
          GButton(icon: Icons.settings,text: 'Settings',onPressed: (){
            onItemTapped(2);

          },),
        ],
      ),
    );

  }
}