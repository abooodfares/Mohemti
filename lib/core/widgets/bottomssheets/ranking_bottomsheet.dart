import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohemti/core/helper/route_extention.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';

class RankingBotttomsheeet extends StatefulWidget {
  const RankingBotttomsheeet({super.key});

  @override
  State<RankingBotttomsheeet> createState() => _RankingBotttomsheeetState();
}

class _RankingBotttomsheeetState extends State<RankingBotttomsheeet> {
  final List<Map<String, dynamic>> options = [
    {'priority': 1, 'icon': 'Assets/icons/Priorities=High.png'},
    {'priority': 2, 'icon': 'Assets/icons/Priorities=Medium.png'},
    {'priority': 3, 'icon': 'Assets/icons/Priorities=Low.png'},
    {'priority': 4, 'icon': 'Assets/icons/Priorities=No.png'},
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              return RadioListTile<int>(
                value: index,
                groupValue: selectedIndex,
                activeColor: appcolors.secondaryColor,
                title: Row(
                  children: [
                    Image.asset(
                      options[index]['icon'],
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 10),
                 
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value!;
                  });
                },
              );
            },
          ),
          Center(
            child: MyAppButton(
              onPressed: () {
                // Pass the selected priority number to TaskCubit
                context
                    .read<TaskCubit>()
                    .changeRanking(options[selectedIndex]['priority']);

                context.pop();
              },
              mytext: 'تم',
            ),
          ),
        ],
      ),
    );
  }
}
