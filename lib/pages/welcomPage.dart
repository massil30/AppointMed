import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/features/Auth/login.dart';
import 'package:responsivity/utils/theme_extention.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset('images/logob.png', width: 150.w, height: 150.h),
                  // Title
                  Text(
                    "Skin First",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: context.primary,
                    ),
                  ),
                  // Description
                  Text(
                    "Dermatology Center",
                    style: TextStyle(fontSize: 16.sp, color: context.primary),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Welcome to your health center where you can find the best doctors in the world",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff070707),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: width / 1.8,
                      height: 50.h,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        context.go(RouteNames.login);
                        // Your action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ), // Border radius 30
                        ),
                      ),
                      child: AutoSizeText(
                        "Log in",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ), // Optional text style
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: width / 1.8,
                      height: 50.h,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Your action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ), // Border radius 30
                        ),
                      ),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: context.primary,
                        ), // Optional text style
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
