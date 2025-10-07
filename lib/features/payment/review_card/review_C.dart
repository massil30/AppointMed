import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/components/dialogs.dart';
import 'package:responsivity/components/searchfield.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/features/payment/review_card/review_widget.dart';
import 'package:responsivity/utils/theme_extention.dart';

class DoctorAppointmentCard extends StatelessWidget {
  const DoctorAppointmentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 375.w,
        margin: EdgeInsets.symmetric(horizontal: 16.w),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            Divider(height: 1.h, color: const Color(0xFFE0E0E0)),
            buildAppointmentDetails(),
            Divider(height: 1.h, color: const Color(0xFFE0E0E0)),
            buildPricingDetails(),
            Divider(height: 1.h, color: const Color(0xFFE0E0E0)),
            build_payment_methode(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=400&h=400&fit=crop',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Dr. Olivia Turner, M.D.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2196F3),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2196F3),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.verified,
                        color: Colors.white,
                        size: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  'Dermato-Endocrinology',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFF757575),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: const Color(0xFF2196F3),
                            size: 12.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '5',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF2196F3),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: const Color(0xFF2196F3),
                            size: 12.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '60',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF2196F3),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
