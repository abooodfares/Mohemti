import 'package:flutter/material.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/features/auth/login/view/loginview.dart';
import 'package:mohemti/features/auth/register/view/register_view.dart';
import 'package:mohemti/features/home/view/home_view.dart';
import 'package:mohemti/features/onbording/view/onbordingview.dart';
class AppRouterManger {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.OnBording:
        return MaterialPageRoute(builder: (_) => const OnbordingView());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) =>  RegisterView());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) =>  LoginView());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }

  
}