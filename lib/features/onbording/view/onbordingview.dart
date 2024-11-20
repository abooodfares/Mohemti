import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';

class OnbordingView extends StatelessWidget {
  const OnbordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
      
          children: [
            SizedBox(
              height: 199.h,),
         SvgPicture.asset("Assets/imgs/appchckimg.svg"),
         SizedBox(
            height: 30.h,),
         Text('مهمتي',style: AppTextStyles.weight700size48
         
          ),
          SizedBox(
            height: 10.h,
          ),
          Text('إدارة وتنظيم مهامك اليومية بسهولة',style: AppTextStyles.weight400size16,),
          SizedBox(
            height: 230.h,
          ),
          MyAppButton(onPressed: (){},mytext: 'تسجيل الدخول',),
          SizedBox(
            height: 17.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment. center,
            children: [
               Text( 'ليس لديك حساب',style: AppTextStyles.weight400size16,),
               Text('!',style: AppTextStyles.weight400size16,),
                 Text(' انشئ حساب',style: AppTextStyles.weight400size16.copyWith(color: Color(0xFF7660CF)),),
               
             
             
            
            
            ],
          ),
          

          
          ],
        ),
      ),

    );
  }
}