import 'package:flutter/material.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/features/home/widgets/Genral_bottomsheet.dart';
import 'package:mohemti/features/home/widgets/my_bottomsheet.dart';

class MyflotingActionButton extends StatelessWidget {
  const MyflotingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              FloatingActionButton(
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  backgroundColor: appcolors.secondaryColor,
                  onPressed: () {
                showModalBottomSheet(context: context, builder: (context) => MyBottomSheet(child: Genral_bottomsheet(controller: TextEditingController()),));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            ],
          ),
        );
  }
}