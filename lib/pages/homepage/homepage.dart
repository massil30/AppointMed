import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/searchfield.dart';
import 'package:responsivity/pages/homepage/home_widget/daily_list.dart';
import 'package:responsivity/pages/homepage/home_widget/doctor_card.dart';
import 'package:responsivity/pages/homepage/home_widget/home_appbar.dart';
import 'package:responsivity/pages/homepage/home_widget/shcedule_card.dart';

import 'package:responsivity/utils/theme_extention.dart';

import '../../config/routes/routesName.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<Map<String, String>> doctors_home = [
  {"name": "Dr. Ahmed", "specialty": "Cardiologist"},
  {"name": "Dr. Sarah", "specialty": "Dermatologist"},
  {"name": "Dr. Karim", "specialty": "Neurologist"},
  {"name": "Dr. Amina", "specialty": "Pediatrician"},
  {"name": "Dr. Ali", "specialty": "Orthopedic"},
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 16.sp, left: 24.sp, right: 24.sp),
                child: home_appbar(context),
              ),

              SizedBox(height: 24),
              Container(
                margin: EdgeInsets.only(left: 24.sp, right: 24.sp),
                child: SearchField(prefixIcon: true),
              ),
              SizedBox(height: 16.h),

              Container(
                color: context.secondary,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                child: Column(
                  children: [
                    horizontalDayList(context),
                    SizedBox(height: 12.sp),
                    scheduleTimeline(context),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Doctors',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.push(RouteNames.doctors);
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: context.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              doctors_list(),
              SizedBox(height: 45.h),
            ],
          ),
        ),
      ),
    );
  }

  LayoutBuilder doctors_list() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool canFitTwo = constraints.maxWidth >= 900;
        return Wrap(
          children: [
            for (var doctor in doctors_home)
              SizedBox(
                width: canFitTwo
                    ? (constraints.maxWidth / 2) -
                          15 // 2 per row
                    : constraints.maxWidth,
                child: DoctorCard(
                  name: doctor["name"]!,
                  specialty: doctor["specialty"]!,
                  imageUrl:
                      'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                  rating: 5,
                  reviews: 60,
                ),
              ),
          ],
        );
      },
    );
  }
}
