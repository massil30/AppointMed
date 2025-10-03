import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/components/dialogs.dart';
import 'package:responsivity/components/textfield.dart';
import 'package:responsivity/utils/theme_extention.dart';

class ReviewAppointement extends StatefulWidget {
  const ReviewAppointement({super.key});

  @override
  State<ReviewAppointement> createState() => _ReviewAppointementState();
}

class _ReviewAppointementState extends State<ReviewAppointement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Review'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "Share with us you're opinion to improve our service",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12.h),
            CircleAvatar(
              radius: 100.r,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/10.jpg',
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Dr Attaf Massil ',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: context.primary,
              ),
            ),
            Text(
              'Dermato-Endocrinology ',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
            ),

            SizedBox(height: 16.h),
            CustomTextField(
              maxLines: 4,
              label: 'Review',
              hint: 'enter your comment here... ',
            ),
            SizedBox(height: 36.h),
            CustomButton(
              text: 'Add Review',
              width: double.infinity,
              onPressed: () {
                AppDialogs.showSuccess(
                  context,
                  message: 'Thanks for sharing your review !',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
