import 'package:flutter/material.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/theme/text_style.dart';

class UserTaskCatecogery extends StatelessWidget {
   UserTaskCatecogery({super.key});
  List<String> categories = ['الكل', 'العمل', 'الشخصية', 'الصحة', 'الترفيه'];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (int i = 0; i < categories.length; i++)
          Padding(
            padding: leftPadding(5),
            //is in seem file
            child: TaskCategory(mytext: categories[i],),
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
    return  Container(
            alignment: Alignment.center,
            constraints:
                BoxConstraints(minWidth: 40, minHeight: 32),
            padding: allPadding(10),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF958DB8)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(44)),
            child: Text(
              mytext,
              style: AppTextStyles.weight400size12white.copyWith(
                color: Color(0xFF958DB8),
              ),
              textAlign: TextAlign.center,
            ));
  }
}