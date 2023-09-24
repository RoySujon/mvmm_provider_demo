import 'package:flutter/material.dart';
import 'package:mvmm_provider_demo/view/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: Colors.red,
        // appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        // scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        // useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
