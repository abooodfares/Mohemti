import 'package:flutter/material.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/widgets/my_app_textfield.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
    TextEditingController emailcontroller=TextEditingController();
      TextEditingController passwordcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        MyTextField(
                controller: emailcontroller,
                labelText: 'البريد الالكتروني',
                icon: Icons.email_outlined,
          

              ),
              verticalSpace(15),
              MyTextField(controller:passwordcontroller , labelText: 'كلمة المرور', icon: Icons.visibility_outlined,)
      ]
    ));
  }
}