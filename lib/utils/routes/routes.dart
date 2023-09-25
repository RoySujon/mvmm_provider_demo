import 'package:flutter/material.dart';
import 'package:mvmm_provider_demo/utils/routes/routes_name.dart';
import 'package:mvmm_provider_demo/view/home/home_screen.dart';
import 'package:mvmm_provider_demo/view/login/login_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes() => {
        RoutesName.homeScreen: (context) => const HomeScreen(),
        RoutesName.loginScreen: (context) => const LoginScreen(),
        // RoutesName.homeScreen: (context) => const HomeScreen(),
      };
}
