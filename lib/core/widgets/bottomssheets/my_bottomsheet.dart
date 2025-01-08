// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/core/widgets/my_app_textfield.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';
import 'package:mohemti/core/widgets/bottomssheets/Genral_bottomsheet.dart';
import 'package:mohemti/features/home/widgets/TaskDataContainor.dart';

class MyBottomSheet extends StatelessWidget {
  final Widget child;
  MyBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: symmetricHorizontalPadding(12),
        alignment: Alignment.centerRight,
        height: MediaQuery.of(context).size.height / 0.5,
        width: double.infinity,
        child: child,
      ),
    );
  }
}
