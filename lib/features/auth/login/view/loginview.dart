

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/my_app_icons.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/have_acount_already.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/core/widgets/my_app_textfield.dart';
import 'package:mohemti/features/auth/login/widgets/login_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohemti/features/auth/widgets/or_img_auth.dart';
import 'package:mohemti/features/auth/widgets/or_login_with.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(85),
            Padding(
              padding: rightPadding(20),
              child: Text('تسجيل الدخول',style: AppTextStyles.weight700size48.copyWith(
                
                fontSize: 40.sp,
                color: Colors.black
              
              )),
            ),
            verticalSpace(100),
            Padding(
              padding: symmetricHorizontalPadding(8),
              child: LoginForm()
            ),
            verticalSpace(30),
            Padding(
              padding: EdgeInsets.only(right: 20.w ),
              child: Container(
     padding: EdgeInsets.only(
       bottom: 1, // Space between underline and text
     ),
     decoration: BoxDecoration(
         border: Border(bottom: BorderSide(
         color: Colors.black, 
         width: 1.0, // Underline thickness
        ))
              ),
      
                child: Text('هل نسيت كلمة السر؟',style: AppTextStyles.weight400size16.copyWith(
       
                  
                  color: Color(0xff000000
                ),
                ),),
              ),
            )
            ,
            verticalSpace(50),
            Padding(
              padding: rightPadding(12),
              child: MyAppButton(onPressed: (){},mytext: 'تسجيل الدخول',),
            ),
           OrLoginWith(isloginpage: true,)

          
        
        
          ],
        ),
      ),
    );
  }
}

