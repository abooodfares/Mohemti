import 'package:flutter/material.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/features/onbording/view/onbordingview.dart';
class AppRouterManger {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.OnBording:
        return MaterialPageRoute(builder: (_) => const OnbordingView());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }

  
}