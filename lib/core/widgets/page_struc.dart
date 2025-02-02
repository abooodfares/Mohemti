import 'package:flutter/material.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/features/clander/calender_view.dart';
import 'package:mohemti/features/home/view/home_view.dart';

class PageStruc extends StatefulWidget {
  const PageStruc({super.key});

  @override
  State<PageStruc> createState() => _PageStrucState();
}

class _PageStrucState extends State<PageStruc> {
  int currentindex = 0;
   final List<Widget> pages = [
HomeView(),
    Center(child: Text("Tasks Page")),
CalenderView(),
    Center(child: Text("Settings Page")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      bottomNavigationBar:Container(
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

      ),
      body: pages[currentindex],

    );
  }
}
