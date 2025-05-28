import 'package:banking_app/app/config/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../app/config/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();


    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteName.onboardScreen);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.splashImg,height: 8.h,),
            SizedBox(width: 2.w,),
            Text('Fiacto',style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),)
          ],
        ),
      ),
    );
  }
}
