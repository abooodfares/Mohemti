import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';
import 'package:mohemti/features/home/widgets/no_task_img.dart';
import 'package:mohemti/features/home/widgets/task_in_home_view.dart';

class TasksListVIew extends StatelessWidget {
  const TasksListVIew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
  child: ListView.separated(
    separatorBuilder: (context, index) => verticalSpace(10),
    itemCount: BlocProvider.of<HomeCubit>(context).tasks.length,
    itemBuilder: (context, index) {
      final task = BlocProvider.of<HomeCubit>(context).tasks[index];
      if (BlocProvider.of<HomeCubit>(context).text == 'الكل' || task.category == BlocProvider.of<HomeCubit>(context).text) {
        return TaskInHomeView(
        task: task,
      );
      }
      return NoTaskImg();
      


      
      
    },
  ),
);
  }
}