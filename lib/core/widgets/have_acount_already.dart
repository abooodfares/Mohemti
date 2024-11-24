import 'package:flutter/material.dart';
import 'package:mohemti/core/helper/route_extention.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/core/theme/text_style.dart';

class dontHaveAcount extends StatelessWidget {
  const dontHaveAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
            mainAxisAlignment: MainAxisAlignment. center,
            children: [
               Text( 'ليس لديك حساب',style: AppTextStyles.weight400size16,),
               Text('!',style: AppTextStyles.weight400size16,),
                 GestureDetector(onTap: () => context.pushNamed(AppRoutes.register),child: Text(' انشئ حساب',style: AppTextStyles.weight400size16.copyWith(color: Color(0xFF7660CF)),)),
                 
               
             
             
            
            
            ],
          );
  }
}

class HaveAcountAlready extends StatelessWidget {
  const HaveAcountAlready({super.key});

  @override
  Widget build(BuildContext context) {
  
    return  Row(
            mainAxisAlignment: MainAxisAlignment. center,
            children: [
               Text( ' لديك حساب',style: AppTextStyles.weight400size16,),
               Text('!',style: AppTextStyles.weight400size16,),
                 GestureDetector(onTap: () => context.pushNamed(AppRoutes.login),child: Text(' سجيل الدخول',style: AppTextStyles.weight400size16.copyWith(color: Color(0xFF7660CF)),)),
               
             
             
            
            
            ],
          );
  }
  }
