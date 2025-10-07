import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/components/dialogs.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/utils/theme_extention.dart';

// Custom Tab Button

// Custom Appointment Card
class AppointmentCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final String type;
  const AppointmentCard({super.key, required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    if (type == 'Complete') {
      return buildCompleteCard(context);
    } else if (type == 'Upcoming') {
      return _buildUpcomingCard(context);
    } else {
      return _buildCancelledCard(context);
    }
  }

  Widget buildCompleteCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 45.r,
                backgroundImage: NetworkImage(data['image']),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'],
                      style: TextStyle(
                        color: const Color(0xFF2196F3),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    Text(
                      data['specialty'],
                      style: TextStyle(color: Colors.black87, fontSize: 13.sp),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: context.primary,
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text('40'),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),

                        Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: context.primary,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  backgroundColor: Colors.white,
                  text: 'Re-Book',
                  textColor: context.primary,
                  onPressed: () {},
                  height: 35.h,
                  borderRadius: 18,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomButton(
                  backgroundColor: context.primary,
                  text: 'Add Review',
                  textColor: Colors.white,
                  onPressed: () {},
                  height: 35.h,
                  borderRadius: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: NetworkImage(data['image']),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'],
                      style: TextStyle(
                        color: const Color(0xFF2196F3),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      data['specialty'],
                      style: TextStyle(color: Colors.black87, fontSize: 13.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          FittedBox(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.r),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: context.primary,
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        data['date'],
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13.sp,
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
                    borderRadius: BorderRadius.circular(13.r),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: const Color(0xFF2196F3),
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        data['time'],
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  backgroundColor: context.primary,
                  text: 'Add Review',
                  textColor: Colors.white,
                  onPressed: () {},
                  height: 35.h,
                  borderRadius: 18,
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.check, color: context.primary),
                  padding: EdgeInsets.all(12.w),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    AppDialogs.showConfirm(
                      context,
                      onconfirm: () {
                        context.push(RouteNames.cancelAppointement);
                      },
                    );
                  },
                  icon: Icon(Icons.close, color: context.primary),
                  padding: EdgeInsets.all(12.w),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCancelledCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 45.r,
                backgroundImage: NetworkImage(data['image']),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'],
                      style: TextStyle(
                        color: const Color(0xFF2196F3),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      data['specialty'],
                      style: TextStyle(color: Colors.black87, fontSize: 13.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              backgroundColor: context.primary,
              text: 'Add Review',
              textColor: Colors.white,
              onPressed: () {},
              height: 35.h,
              borderRadius: 18,
            ),
          ),
        ],
      ),
    );
  }
}
