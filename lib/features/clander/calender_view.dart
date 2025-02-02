import 'package:flutter/material.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/features/clander/widgets/calender_task_listview.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderView extends StatefulWidget {
  @override
  _CalenderView createState() => _CalenderView();
}

class _CalenderView extends State<CalenderView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // List of "done" days (example)
  final List<DateTime> doneDays = [
    DateTime(2024, 10, 10),
    DateTime(2024, 10, 15),
    DateTime(2024, 10, 20),
  ];

  @override
  Widget build(BuildContext context) {
    return 
      
      
       Column(
        children: [
          Text(
          'التقويم',
          style: AppTextStyles.weight700size24black,
          textDirection: TextDirection.rtl,
        ),
          TableCalendar(
            formatAnimationCurve: Curves.slowMiddle,
            locale: 'ar',
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!doneDays.contains(selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // Update calendar focus
                });
              }
            },
            enabledDayPredicate: (day) {
              // Disable "done" days and any day before today
              return !doneDays.contains(day) &&
                  day.isAfter(DateTime.now().subtract(Duration(days: 1)));
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: appcolors.secondaryColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(color: Colors.black),
              defaultTextStyle: TextStyle(color: Colors.black),
              disabledTextStyle: TextStyle(color: Colors.grey),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              leftChevronIcon: Icon(Icons.chevron_left),
              rightChevronIcon: Icon(Icons.chevron_right),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.black),
              weekdayStyle: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: Container(
              color: appcolors.textgraywhite,
              child: _selectedDay != null
                  ? CalenderTaskListview( date: _selectedDay!,)
                  : Center(
                      child: Text(
                        'Please select a date.',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
            ),
          ),
        ],
      
    );
  }
}
