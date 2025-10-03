import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/components/dialogs.dart';
import 'package:responsivity/components/searchfield.dart';
import 'package:responsivity/features/payment/review_C.dart';
import 'package:responsivity/utils/theme_extention.dart';

class PaymentReview extends StatefulWidget {
  const PaymentReview({super.key});

  @override
  State<PaymentReview> createState() => _PaymentReviewState();
}

class _PaymentReviewState extends State<PaymentReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: context.primary,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // AppBar Row
                    Row(
                      children: [
                        InkWell(
                          onTap: () => context.pop(),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(width: 80.w),
                        Text(
                          "Payment",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "\$ 100.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Tab Buttons
                  ],
                ),
              ),
              DoctorAppointmentCard(),
              SizedBox(height: 16.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomButton(
                  width: double.infinity,
                  text: 'Pay Now',
                  onPressed: () {
                    AppDialogs.showSuccess(
                      context,
                      message: "Thanks you're appointement successfully booked",
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
