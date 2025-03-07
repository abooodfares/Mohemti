import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mohemti/core/routes/app_router_manger.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/core/services/notiservies/noti_servies.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohemti/core/widgets/page_struc.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:ui' as ui;

import 'package:mohemti/features/home/cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting(); 
  await ScreenUtil.ensureScreenSize();
  await NotificationService.initialize();


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
      child: BlocProvider(
        create: (context) =>HomeCubit(),
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
              primaryColor: appcolors.primaryColor),
          debugShowCheckedModeBanner: false,
   
       home:PageStruc(),
          locale: const Locale('ar'),
        ),
      ),
    );
  }
}
