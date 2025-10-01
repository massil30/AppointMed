import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/responsivity.dart';
import 'package:responsivity/utils/theme_extention.dart';

Widget horizontalDayList(BuildContext context) {
  final days = [
    {"day": "MON", "num": "9"},
    {"day": "TUE", "num": "10"},
    {"day": "WED", "num": "11"},
    {"day": "THU", "num": "12"},
    {"day": "FRI", "num": "13"},
    {"day": "SAT", "num": "14"},
    {"day": "SUN", "num": "15"},
  ];

  return SizedBox(
    height: 60.sp, // ScreenUtil → makes height adapt to screen size
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: days.length,
      itemBuilder: (context, index) {
        final isSelected = index == 0; // Example: highlight first item
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w), // responsive spacing
          child: FittedBox(
            child: Container(
              width: 60.w, // ensures all items same width (responsive)
              padding: EdgeInsets.only(
                top: 12.h,
                bottom: 8.h,
                left: 6.w,
                right: 6.w,
              ),
              decoration: BoxDecoration(
                color: isSelected ? context.primary : Colors.white,
                borderRadius: BorderRadius.circular(18.r), // responsive radius
              ),
              child: Column(
                children: [
                  Text(
                    days[index]["num"]!,
                    style: TextStyle(
                      fontSize: 24.sp, // ScreenUtil for scalable font
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    days[index]["day"]!,
                    style: TextStyle(
                      fontSize: 12.sp, // smaller font for weekday
                      fontWeight: FontWeight.normal,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
