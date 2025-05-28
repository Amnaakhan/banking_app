import 'package:banking_app/app/config/app_assets.dart';
import 'package:banking_app/app/config/app_colors.dart';
import 'package:banking_app/widgets/button_widget.dart';
import 'package:banking_app/widgets/input_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../ViewModel/AuthViewModel/auth_view_model.dart';
import '../../app/config/app_pages.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  final AuthViewModel controller = Get.put(AuthViewModel());

  final emailFocusNode = FocusNode();
  final namFocusNode = FocusNode();
  final phoneNoFocusNode = FocusNode();
  final confrmpassFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();
  bool _isObscure = true;
  bool _isObscureConfirm = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneNoController.dispose();
    confirmpassController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    namFocusNode.dispose();
    phoneNoFocusNode.dispose();
    confrmpassFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 7.h,left: 5.w,right: 5.w,bottom: 2.h),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);

                  },
                    child: Image.asset(AppImages.backArrow,height: 5.h,)),
                SizedBox(width: 18.w,),
                Text('Create Your Account',style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                  fontFamily: 'Montserrat',
                ),)
              ],
            ),
            SizedBox(height: 5.h,),
            Text('Let’s Get You Started',style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              fontFamily: 'Montserrat',
            ),),
            SizedBox(height: 2.h,),

            Text('Sign up to manage your crypto and convert it to fiat anytime, anywhere.',
              style: TextStyle(color: AppColors.greyColor,
              fontSize: 11.sp,

              fontFamily: 'Montserrat',
            ),
            textAlign: TextAlign.center,),
            SizedBox(height: 3.h,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Full Name',style: TextStyle(fontSize: 9.sp ,
                fontWeight: FontWeight.w600,
                color: AppColors.greyColor,
                fontFamily: 'Montserrat',
              ),),
            ),
            SizedBox(height: 1.h,),
            InputTextField(
              myController: nameController,
              focusNode: namFocusNode,

              onFieldSubmittedValue: (value) {

                // You can trigger validation or API calls here if necessary
              },
              keyBoardType: TextInputType.name,
              obscureText: false,
              hint: 'Lois becke',

              onValidator: (value) {

              },
            ),
            SizedBox(height: 2.h,),

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
              child: Text('Phone Number',style: TextStyle(fontSize: 9.sp ,
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
              hint: '+92 31xxxxxxxx',

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
              myController: confirmpassController,
              focusNode: confrmpassFocusNode,
              onFieldSubmittedValue: (value) {},
              keyBoardType: TextInputType.text,
              obscureText: _isObscureConfirm,
              hint: '********',
              suffixIcon: Icon(
                _isObscureConfirm ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              ),
              onSuffixIconPress: () {
                setState(() {
                  _isObscureConfirm = !_isObscureConfirm;
                });
              },
              onValidator: (value) {
                if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            Expanded(child: Align(
              alignment: Alignment.bottomCenter,
                child:
                controller.isLoading.value?
                    Center(child: CircularProgressIndicator(),):
                ButtonWidget(text: 'Continue', onPressed: (){
                  controller.signUp(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                  Navigator.pushReplacementNamed(context, RouteName.otpScreen);

                },backgroundColor: AppColors.primaryColor,)))
          ],
        ),
      ),
    );
  }
}
