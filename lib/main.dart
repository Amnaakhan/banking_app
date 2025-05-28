import 'package:banking_app/View/Auth/login_screen.dart';
import 'package:banking_app/View/Auth/sign_up_screen.dart';
import 'package:banking_app/View/Home/home_screen.dart';
import 'package:banking_app/View/NavBar/bottom_bar.dart';
import 'package:banking_app/View/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'View/Auth/otp_screen.dart';
import 'View/Auth/verification_screen.dart';
import 'View/Onboarding/onboading_screen.dart';
import 'app/config/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType)
    {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        onGenerateRoute: Routes.generateRoute,

      );
    });
  }
}

