import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';
import 'package:mohemti/features/home/widgets/task_in_home_view.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderTaskListview extends StatelessWidget {
  const CalenderTaskListview({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final tasks = homeCubit.tasks;

    // Filter tasks based on the selected date
    final filteredTasks = tasks.where((task) {
      return isSameDay(task.date, date); // Use isSameDay for comparison
    }).toList();

    if (filteredTasks.isEmpty) {
      return Center(
        child: Text(
          'No tasks for this date.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        final task = filteredTasks[index];
        return TaskInHomeView(
          index: index,
          task: task,
        );
      },
    );
  }
}
