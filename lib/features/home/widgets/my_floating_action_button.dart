import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';
import 'package:mohemti/core/widgets/bottomssheets/Genral_bottomsheet.dart';
import 'package:mohemti/core/widgets/bottomssheets/my_bottomsheet.dart';

class MyflotingActionButton extends StatelessWidget {
   MyflotingActionButton({super.key});
  var taskCubit= TaskCubit();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
     create: (context) => taskCubit ,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            FloatingActionButton(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              backgroundColor: appcolors.secondaryColor,
              onPressed: () {
                // Use the correct context
             
                
      
                showModalBottomSheet(
                  context: context,
                  builder: (context) => MyBottomSheet(
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider.value(value: taskCubit),
                    
                      ],
                      child: Genral_bottomsheet(
                        controller: TextEditingController(),
                      ),
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
