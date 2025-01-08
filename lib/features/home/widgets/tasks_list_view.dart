import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';
import 'package:mohemti/features/home/widgets/no_task_img.dart';
import 'package:mohemti/features/home/widgets/task_in_home_view.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var taskCubit = TaskCubit();
    return BlocProvider(
      create: (context) => taskCubit,
      child: Expanded(
        child: Builder(
          builder: (context) {
            final homeCubit = BlocProvider.of<HomeCubit>(context);
            final tasks = homeCubit.tasks;
            final filteredTasks = tasks.where((task) {
              return homeCubit.text == 'الكل' || task.category == homeCubit.text;
            }).toList();

            if (filteredTasks.isEmpty) {
              return const Center(child: NoTaskImg());
            }

            return ListView.separated(
              separatorBuilder: (context, index) => verticalSpace(10),
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                final task = filteredTasks[index];
                return BlocProvider.value(
                  value: taskCubit,
                  child: TaskInHomeView(
                    index: index,
                    task: task,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
