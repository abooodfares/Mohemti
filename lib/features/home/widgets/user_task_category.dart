import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';

class UserTaskCatecogery extends StatelessWidget {
  UserTaskCatecogery({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories =
        BlocProvider.of<HomeCubit>(context).categories;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (int i = 0; i < categories.length; i++)
          Padding(
            padding: leftPadding(5),
            //is in seem file
            child: TaskCategory(
              mytext: categories[i],
            ),
          ),
      ]),
    );
  }
}

class TaskCategory extends StatelessWidget {
  const TaskCategory({super.key, required this.mytext});

  final String mytext;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<HomeCubit>(context).changeCategory(mytext);
          },
          child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(minWidth: 40, minHeight: 32),
              padding: allPadding(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF958DB8)),
                  color: BlocProvider.of<HomeCubit>(context).text == mytext
                      ? appcolors.secondaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(44)),
              child: Text(
                mytext,
                style: AppTextStyles.weight400size12white.copyWith(
                  color:BlocProvider.of<HomeCubit>(context).text == mytext
                      ? Color(0xFFFFFFFF): Color(0xFF958DB8),
                ),
                textAlign: TextAlign.center,
              )),
        );
      },
    );
  }
}
