import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/my_bottom_navigationbar.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';
import 'package:mohemti/features/home/widgets/SeeYourActivitySentnce.dart';
import 'package:mohemti/features/home/widgets/home_view_first_row.dart';
import 'package:mohemti/features/home/widgets/my_floating_action_button.dart';
import 'package:mohemti/features/home/widgets/user_task_category.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: Scaffold(
        floatingActionButton: MyflotingActionButton(),
        bottomNavigationBar: Mybottomnavigtionbar(),
        backgroundColor: Color(0xFFFFFFFF),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeViewFirstRow(),
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
                  color: appcolors.textgraywhite,
                  child: Center(child: Image.asset('Assets/imgs/no task .png')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
