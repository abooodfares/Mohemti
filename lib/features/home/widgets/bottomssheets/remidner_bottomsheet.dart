import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohemti/core/helper/route_extention.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';

class Remidner_Bottomsheet extends StatefulWidget {
  const Remidner_Bottomsheet({super.key});

  @override
  State<Remidner_Bottomsheet> createState() => _Remidner_BottomsheetState();
}

class _Remidner_BottomsheetState extends State<Remidner_Bottomsheet> {
  final List<String> options = [
    "5",
   
    "1",
    "3",
    "10",
  
  ];

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
                    options[index],
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
                     context.read<TaskCubit>().changeReminder(int.parse( options[selectedIndex]));
                         context.pop();
                      
                    },
                    mytext: 'تم'))
          ],
        ));
  }
}
