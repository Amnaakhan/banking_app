import 'package:banking_app/app/config/app_assets.dart';
import 'package:banking_app/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../ViewModel/AuthViewModel/auth_view_model.dart';
import '../../app/config/app_colors.dart';
import '../../app/config/app_pages.dart';
import '../../widgets/input_text_field.dart';

class LoginScreeen extends StatefulWidget {
  const LoginScreeen({super.key});

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final AuthViewModel controller = Get.put(AuthViewModel());

  final emailFocusNode = FocusNode();


  final passwordFocusNode = FocusNode();
  bool _isObscure = true;
  bool isChecked = false; // Checkbox state


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();


    emailFocusNode.dispose();
    passwordFocusNode.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10.h,left: 5.w,right: 5.w,bottom: 2.h),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.splashImg,height: 5.h,),
            SizedBox(height: 5.h,),
            Text('Get Started now',style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              fontFamily: 'Montserrat',
            ),),
            SizedBox(height: 2.h,),

            Text('Create an account or log in to explore about our app',
              style: TextStyle(color: AppColors.greyColor,
                fontSize: 11.sp,

                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Email',style: TextStyle(fontSize: 9.sp ,
                fontWeight: FontWeight.w600,
                color: AppColors.greyColor,
                fontFamily: 'Montserrat',
              ),),
            ),
            SizedBox(height: 1.h,),
            InputTextField(
              myController: emailController,
              focusNode: emailFocusNode,

              onFieldSubmittedValue: (value) {

                // You can trigger validation or API calls here if necessary
              },
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
              hint: 'Loisbecket@gmail.com',

              onValidator: (value) {

              },
            ),
            SizedBox(height: 2.h,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Password',style: TextStyle(fontSize: 9.sp ,
                fontWeight: FontWeight.w600,
                color: AppColors.greyColor,
                fontFamily: 'Montserrat',
              ),),
            ),
            SizedBox(height: 1.h,),
            InputTextField(
              myController: passwordController,
              focusNode: passwordFocusNode,
              onFieldSubmittedValue: (value) {},
              keyBoardType: TextInputType.text,
              obscureText: _isObscure,
              hint: '********',
              suffixIcon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,color: Colors.white,),
              onSuffixIconPress: () {
                setState(() {
                  _isObscure = !_isObscure;
                });

              },

              onValidator: (value) {

              },
            ),
            SizedBox(height: 2.h,),

            Row(
              children: [
                Checkbox(
                  value: isChecked,

                  activeColor: AppColors.primaryColor,

                  // Checkbox color
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  "Remember Me",
                  style: TextStyle(fontSize: 10.sp,
                    fontFamily: 'Montserrat',
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w600
                  )// Checkbox state
                  ,
                ),
                Spacer(),
                Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 10.sp,
                      fontFamily: 'Montserrat',
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500

                  )// Checkbox state
                  ,
                ),
              ],
            ),
            SizedBox(height: 3.h,),
            controller.isLoading.value?
                Center(child: CircularProgressIndicator()):
            ButtonWidget(text: 'Login', onPressed: (){
              controller.login(emailController.text, passwordController.text);
              // Navigator.pushReplacementNamed(context, RouteName.verificationScreen);

            }
              ,backgroundColor: AppColors.primaryColor,),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        fontSize: 9.sp,color: AppColors.greyColor,
                        fontFamily: 'Montserrat',

                      ),
                    ),
                    SizedBox(width: 1.w,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, RouteName.signup);
                      },
                      child: Text(
                          'Create one',
                          style: TextStyle(
                            fontSize: 9.sp,
                            color: AppColors.primaryColor,
                            fontFamily: 'Montserrat',

                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
