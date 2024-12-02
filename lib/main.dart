import 'package:flutter/material.dart';
import 'package:mohemti/core/routes/app_router_manger.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

void main() async{
  await ScreenUtil.ensureScreenSize();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
         builder: (context, child) {
          // Forces the app to start with RTL direction for Arabic locale
          return Directionality(
            textDirection: ui.TextDirection.rtl,
            child: child!,
          );
        },

        theme: ThemeData(
          
          
          fontFamily: 'IBMPlexSansArabic',
          primaryColor: appcolors.primaryColor
          
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouterManger.generateRoute,
        initialRoute: AppRoutes.home,
       locale: const Locale('ar'),
      ),
    );
  }
}
