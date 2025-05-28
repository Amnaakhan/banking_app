import 'package:banking_app/View/Auth/otp_screen.dart';
import 'package:banking_app/View/Auth/sign_up_screen.dart';
import 'package:banking_app/View/Auth/verification_screen.dart';
import 'package:banking_app/View/Home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../View/Auth/login_screen.dart';
import '../../View/NavBar/bottom_bar.dart';
import '../../View/Onboarding/onboading_screen.dart';
import '../../View/Splash/splash_screen.dart';
import 'app_pages.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {


    // Handle other routes
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.onboardScreen:
        return MaterialPageRoute(builder: (_) =>  OnboardingScreen());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      case RouteName.bottombar:
        return MaterialPageRoute(builder: (_) =>  BottomBar());
      case RouteName.signin:
        return MaterialPageRoute(builder: (_) =>  LoginScreeen());
      case RouteName.signup:
        return MaterialPageRoute(builder: (_) =>  SignUpScreen());
      case RouteName.otpScreen:
        return MaterialPageRoute(builder: (_) =>  OTPScreen());
      case RouteName. verificationScreen:
        return MaterialPageRoute(builder: (_) =>  VerificationScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}