import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';

class CategoryBottomSheet extends StatefulWidget {
  const CategoryBottomSheet({super.key});

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  final List<String> options = ['الكل', 'العمل', 'الشخصية', 'الصحة', 'الترفيه'];
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Center(child: MyAppButton(onPressed: () {
          context.read<TaskCubit>().changeCategory(options[selectedIndex]);
    

          Navigator.pop(context);
        }, mytext: 'تم'))
      ],
    );
  }
}
