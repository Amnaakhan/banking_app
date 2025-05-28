import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../app/config/app_assets.dart';
import '../../app/config/app_colors.dart';
import '../../app/config/app_pages.dart';
import '../../widgets/button_widget.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
    Text('Enter the 6-Digit Code',style: TextStyle(color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 15.sp,
      fontFamily: 'Montserrat',
    ),),
    SizedBox(height: 2.h,),

    Text('Enter the code from your app',
      style: TextStyle(color: AppColors.greyColor,
        fontSize: 11.sp,

        fontFamily: 'Montserrat',
      ),
      textAlign: TextAlign.center,),
    SizedBox(height: 3.h,),
    PinCodeTextField(
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      cursorColor: Colors.black,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 6.h,
        fieldWidth: 6.h,
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
    Text('The code refreshes every 30 seconds 20',
      style: TextStyle(color: AppColors.greyColor,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,

        fontFamily: 'Montserrat',
      ),
      textAlign: TextAlign.center,),
    Expanded(child: Align(
        alignment: Alignment.bottomCenter,
        child: ButtonWidget(text: 'Verify & Enable 2FA', onPressed: (){
          Navigator.pushReplacementNamed(context, RouteName.signin);

        },backgroundColor: AppColors.primaryColor,)))
  ],
),
      ),
    );
  }
}
