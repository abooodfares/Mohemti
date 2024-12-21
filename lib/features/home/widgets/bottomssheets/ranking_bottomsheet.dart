import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohemti/core/helper/route_extention.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';

class RankingBotttomsheeet extends StatefulWidget {
  const RankingBotttomsheeet({super.key});

  @override
  State<RankingBotttomsheeet> createState() => _RankingBotttomsheeetState();
}

class _RankingBotttomsheeetState extends State<RankingBotttomsheeet> {
  final List<int> options = [1, 2, 3];

  int selectedIndex = 2;
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
                  title: Text(
                    options[index].toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: index == selectedIndex
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
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
               context.read<TaskCubit>().changeRanking(options[selectedIndex]);
             
                  
                      context.pop();
                    },
                    mytext: 'تم'))
          ],
        ));
  }
}
