import 'package:banking_app/app/config/app_assets.dart';
import 'package:banking_app/app/config/app_colors.dart';
import 'package:banking_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../app/config/app_pages.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "title": "Discover Fiacto: Your Ultimate\nCrypto Wallet Solution",
      "subtitle": "Buy, store, and convert crypto securely all in\none place.",
      "image": AppImages.onboardImg1
    },
    {
      "title": "Instantly Convert Crypto to Fiat\nwith Ease",
      "subtitle": "Withdraw your crypto to local currency anytime.\nFast, easy, secure.",
      "image": AppImages.onboardImg2
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final data = onboardingData[index];
          return Padding(
            padding: EdgeInsets.only(top: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.splashImg, height: 4.h), // replace with your logo
                    SizedBox(width: 8),
                    Text(
                      "Fiacto",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 5.h,),
                // Image
                Image.asset(data["image"]!, height: 30.h),
                SizedBox(height: 5.h),
                // Title
                Text(
                  data["title"]!,
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2.h),
                // Subtitle
                Text(
                  data["subtitle"]!,
                  style: TextStyle(fontSize: 11.sp, color: AppColors.greyColor,
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),

                // Dot indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: onboardingData.length,
                  effect: WormEffect(
                    dotHeight: 6,
                    dotWidth: 24,
                    spacing: 8,
                    activeDotColor: AppColors.primaryColor,
                    dotColor: Color(0xffE8E8E8),
                    type: WormType.thin,
                    radius: 5,
                  ),
                ),
                SizedBox(height: 12.h),
                // Button
                ButtonWidget(text: 'Login', onPressed: (){
                  Navigator.pushReplacementNamed(context, RouteName.signin);

                },
                  backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to Fiacto?',
                      style: TextStyle(
                        fontSize: 9.sp,color: Colors.grey,
                        fontFamily: 'Montserrat',

                      ),
                    ),
                    SizedBox(width: 1.w,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, RouteName.signup);

                      },
                      child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 9.sp,
                            color: AppColors.primaryColor,
                            fontFamily: 'Montserrat',

                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}