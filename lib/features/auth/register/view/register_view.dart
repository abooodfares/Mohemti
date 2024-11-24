import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/core/widgets/my_app_textfield.dart';
import 'package:mohemti/features/auth/widgets/or_login_with.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
TextEditingController nameController = TextEditingController();

TextEditingController emailController = TextEditingController();

TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Form(
            child: Padding(
              padding: symmetricHorizontalPadding(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(40),
                    Text('انشاء حساب',style: AppTextStyles.weight700size48,),
                    verticalSpace(100),
                    MyTextField(controller:nameController , labelText: 'اسمك الكامل',isfilled: true,)
                    ,verticalSpace(15),
                    MyTextField(controller:emailController , labelText: 'البريد الالكتروني',isfilled: true,)
                    ,verticalSpace(15),
                    MyTextField(controller:passwordController , labelText: 'كلمة المرور',isfilled: true,)
                    ,verticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                
                        MyAppButton(onPressed: (){},mytext: 'انشاء حساب',),
                    
                      ],
                    ),
                        OrLoginWith(isloginpage: false,)
                 
                    
                    
                  ]
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}