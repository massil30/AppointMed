import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/searchfield.dart';
import 'package:responsivity/pages/homepage/home_widget/doctor_card.dart';
import 'package:responsivity/pages/homepage/home_widget/home_appbar.dart';
import 'package:responsivity/test.dart';
import 'package:responsivity/utils/network_image_widget.dart';
import 'package:responsivity/utils/theme_extention.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<Map<String, String>> doctors = [
  {"name": "Dr. Ahmed", "specialty": "Cardiologist"},
  {"name": "Dr. Sarah", "specialty": "Dermatologist"},
  {"name": "Dr. Karim", "specialty": "Neurologist"},
  {"name": "Dr. Amina", "specialty": "Pediatrician"},
  {"name": "Dr. Ali", "specialty": "Orthopedic"},
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
                child: SearchField(),
              ),
              SizedBox(height: 16),

              Container(
                color: context.secondary,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                child: Column(
                  children: [
                    horizontalDayList(context),
                    scheduleTimeline(context),
                  ],
                ),
              ),
              SizedBox(height: 16),

              doctors_list(),
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
            for (var doctor in doctors)
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
