import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/widgets/have_acount_already.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/features/auth/widgets/or_img_auth.dart';

class OrLoginWith extends StatelessWidget {
  const OrLoginWith({super.key, required this.isloginpage});
  final bool isloginpage;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      verticalSpace(30),
      OrImgwidget(),
      verticalSpace(30),
      Loginbuttonwith(
        onPressed: () {},
        mytext: 'الدخول بحساب جوجل',
        color: 0xFFFFFFFF,
        icon: FaIcon(
          FontAwesomeIcons.google,
          color: appcolors.iconscolor,
        ),
        isblacktext: true,
      ),
      verticalSpace(16),
      Loginbuttonwith(
        onPressed: () {},
        mytext: 'الدخول بحساب ابل',
        color: 0xf0000000,
        icon: FaIcon(
          FontAwesomeIcons.apple,
          color: Color(0xffffffff),
        ),
        isblacktext: false,
      ),
      verticalSpace(16),
      Container(child: isloginpage ? dontHaveAcount() :  HaveAcountAlready(),)
    ]);
  }
}
