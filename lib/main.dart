import 'package:flutter/material.dart';
import 'package:mvmm_provider_demo/res/cololors.dart';
import 'package:mvmm_provider_demo/utils/routes/routes.dart';
// import 'package:mvmm_provider_demo/utils/routes/routes_name.dart';
// import 'package:mvmm_provider_demo/view/login/login_screen.dart';
import 'package:mvmm_provider_demo/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        )
      ],
      child: MaterialApp(
        routes: AppRoutes.routes(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // appBarTheme: AppBarTheme(
          //     titleTextStyle:
          //         TextStyle(color: AppColor.kTextColor, fontSize: 24)),
          // textTheme: TextTheme(bodySmall: TextStyle(color: Colors.black)),
          // primaryColor: AppColor.kMainColor,
          // appBarTheme: AppBarTheme(backgroundColor: Colors.black),
          // scaffoldBackgroundColor: AppColor.kMainColor,
          colorScheme: ColorScheme.fromSeed(
              seedColor: AppColor.kMainColor, primary: AppColor.kMainColor),
          // useMaterial3: true,
        ),
        // home: LoginScreen(),
      ),
    );
  }
}
