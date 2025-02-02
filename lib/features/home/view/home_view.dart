import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/helper/route_extention.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/my_bottom_navigationbar.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';
import 'package:mohemti/features/home/widgets/SeeYourActivitySentnce.dart';
import 'package:mohemti/features/home/widgets/home_view_first_row.dart';
import 'package:mohemti/features/home/widgets/my_floating_action_button.dart';
import 'package:mohemti/features/home/widgets/no_task_img.dart';
import 'package:mohemti/features/home/widgets/task_in_home_view.dart';
import 'package:mohemti/features/home/widgets/tasks_list_view.dart';
import 'package:mohemti/features/home/widgets/user_task_category.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeViewFirstRow(),
              verticalSpace(30),
              SeeYourActivitySentnce(),
              verticalSpace(20),
              Padding(
                padding: rightPadding(5),
                child: UserTaskCatecogery(),
              ),
              verticalSpace(2),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.2),
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final tasks = BlocProvider.of<HomeCubit>(context).tasks;

                      if (tasks.isEmpty) {
                        return const NoTaskImg();
                      }
                      if (state is AddTask) {
                        return TasksListView();
                      }
                      return TasksListView();
                    },
                  ),
                ),
              ),
            ],
          ),
          
          /// Floating Action Button Positioned at Bottom Right
          Positioned(
           right: 0,
            bottom: 20, 
      
            child: MyflotingActionButton()
          ),
        ],
      ),
    );
  }
}
