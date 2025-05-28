import 'package:banking_app/app/config/app_assets.dart';
import 'package:banking_app/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> assets = [
    {
      'name': 'Bitcoin (BTC)',
      'price': '1,250.00',
      'growth': '2.35',
      'icon': AppImages.bitcoin,
      'bgColor': Colors.amber,
    },
    {
      'name': 'Ethereum (ETH)',
      'price': '950.00',
      'growth': '1.25',
      'icon': AppImages.ethereum,
      'bgColor': Colors.grey.shade200,
    },
    {
      'name': 'USDT',
      'price': '500.00',
      'growth': '0.00',
      'icon': AppImages.bitcoin,
      'bgColor': Colors.green.shade200,
    },
    // add more coins here
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 30.h,
                  padding: EdgeInsets.only(top:5.h,left: 5.w,right: 5.w,),
        
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImages.Img))
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppImages.draweicon,height: 5.h,),
                          SizedBox(width:15.w),
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
                          Spacer(),
                          Image.asset(AppImages.noticon,height: 5.h),
                          SizedBox(width: 2.w,),
                          Image.asset(AppImages.profile,height: 5.h)
        
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                 padding: EdgeInsets.only( top: 15.h, // adjust this to get perfect overlap
                   left: 5.w,
                   right: 5.w,),
                  child: Image.asset(AppImages.Img1, fit: BoxFit.contain),
                ),
              ],
            ),
            SizedBox(height: 2.h),
        
            Padding(
              padding: EdgeInsets.only(left: 5.w,right: 5.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Assets",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
        
                        ),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
        
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    height: 12.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: assets.length,
                      itemBuilder: (context, index) {
                        var coin = assets[index];
                        return Container(
                          width: 55.w,
                          margin: EdgeInsets.only(right: 3.w),
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.h),
                            border: Border.all(
                                color: Color(0xffD9D9D9)
                          ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 6.h,
                                width: 6.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    coin['icon'],
                                    height: 6.h,
                                  ),
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    coin['name'],
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff767676),
                                      fontFamily: 'Montserrat',
        
        
                                    ),
                                  ),
        
                                  Row(
        
                                    children: [
                                      Text(
                                        coin['price'],
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
        
                                        ),
                                      ),
                                      SizedBox(width: 7.w,),
                                      Text(
                                        coin['growth'],
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontFamily: 'Montserrat',
        
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                      SizedBox(width: 1.w),
        
                                      Image.asset(
                                        AppImages.trade,
                                        height: 2.h,
                                      ),
        
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 2.h),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transactions",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
        
                        ),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
        
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    height: 50.h,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 10.h,
                            padding: EdgeInsets.only(top:2.h,left: 3.w,right: 3.w,bottom: 2.h),
                            margin: EdgeInsets.only(top: 2.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffF8F8F8),
                              borderRadius: BorderRadius.circular(2.h)
                            ),
                            child: Row(
                              children: [
                                Image.asset(AppImages.profile,height: 7.h,),
                                SizedBox(width: 2.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      'Olivia Brown',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',

                                      ),
                                    ),
                                    Text(
                                      'Incoming Transfer',
                                      style: TextStyle(
                                        fontSize: 10.sp,
color: AppColors.greyColor,
                                        fontFamily: 'Montserrat',

                                      ),
                                    ),

                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '+120.00',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',

                                      ),
                                    ),
                                    Text(
                                      'May 28,2025',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.greyColor,
                                        fontFamily: 'Montserrat',

                                      ),
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          );
                        }),
                  )
        
                ],
              ),
            ),
            
        
          ],
        ),
      )
    );
  }
}
