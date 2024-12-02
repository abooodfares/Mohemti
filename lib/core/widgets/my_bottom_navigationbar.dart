import 'package:flutter/material.dart';
import 'package:mohemti/core/theme/colors.dart';

class Mybottomnavigtionbar extends StatefulWidget {
  const Mybottomnavigtionbar({super.key});

  @override
  State<Mybottomnavigtionbar> createState() => _MybottomnavigtionbarState();
}

class _MybottomnavigtionbarState extends State<Mybottomnavigtionbar> {
    int currentindex = 0;
  @override
  Widget build(BuildContext context) {
   return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFFFFFFF),
              width: 1.0,
            ),
          ),
        ),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                currentindex = value;
              });
            },
            selectedIconTheme: IconThemeData(
              color: appcolors.secondaryColor,
            ),
            selectedItemColor: appcolors.secondaryColor,
            backgroundColor: appcolors.textgraywhite,
            elevation: 0,
            currentIndex: currentindex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('Assets/icons/home-2 1.png'),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('Assets/icons/task-square 1.png')),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('Assets/icons/calendar-2 1.png')),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('Assets/icons/setting 1.png')),
                label: '',
              ),
            ]),
      );
  }
}