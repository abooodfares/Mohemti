import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/have_acount_already.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/core/helper/route_extention.dart';

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
          MyAppButton(onPressed: (){
            context.pushNamed(AppRoutes.login);

          },mytext: 'تسجيل الدخول',),
          SizedBox(
            height: 17.h,
          ),
          dontHaveAcount()
        ,
          

          
          ],
        ),
      ),

    );
  }
}