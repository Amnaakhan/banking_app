import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../app/config/app_assets.dart';
import '../../app/config/app_colors.dart';
import '../../app/config/app_pages.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 7.h,left: 5.w,right: 5.w,bottom: 2.h),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(AppImages.backArrow,height: 5.h,),
                  SizedBox(width: 18.w,),
                  Text('Verification',style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp,
                    fontFamily: 'Montserrat',
                  ),)
                ],
              ),
              SizedBox(height: 5.h,),
              Text('Two-Factor Authentication',style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                fontFamily: 'Montserrat',
              ),),
              SizedBox(height: 2.h,),

              Text('We have sent OTP Code via email to ta********24@gmail.com',
                style: TextStyle(color: AppColors.greyColor,
                  fontSize: 11.sp,

                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,),
              SizedBox(height: 3.h,),
              PinCodeTextField(
                keyboardType: TextInputType.number,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                cursorColor: Colors.black,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 7.h,
                  fieldWidth: 7.h,
                  selectedBorderWidth: 1,
                  borderWidth: 1,
                  activeBorderWidth: 1,
                  disabledBorderWidth: 1,
                  inactiveBorderWidth: 1,
                  activeColor: AppColors.borderColor,
                  selectedColor: AppColors.borderColor,
                  inactiveColor: AppColors.borderColor,
                  activeFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  inactiveFillColor:Colors.transparent,

                ),
                textStyle: TextStyle(),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: otpController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
                appContext: context,
              ),
              SizedBox(height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Wait for 00:53',
                    style: TextStyle(
                      fontSize: 9.sp,color: AppColors.greyColor,
                      fontFamily: 'Montserrat',

                    ),
                  ),
                  SizedBox(width: 1.w,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RouteName.bottombar);
                    },
                    child: Text(
                        'Send Again',
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
        ),

    );
  }
}
