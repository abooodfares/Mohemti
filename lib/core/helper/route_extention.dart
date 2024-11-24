import 'package:flutter/material.dart';

extension RouteExtention on BuildContext {
  void pushNamedAndRemoveUntil(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }
  void pushNamed(String routeName) {
    Navigator.pushNamed(this, routeName);
  }
  void pushReplacementNamed(String routeName) {
    Navigator.pushReplacementNamed(this, routeName);
  }
  void pop() {
    Navigator.pop(this);
  }

}
