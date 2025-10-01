// This widget builds a horizontal list of day containers
// Uses ScreenUtil for responsive padding, radius, text sizes
// Uses ResponsiveRowColumn from responsive_framework for consistent scaling

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
    height: 100.h, // ScreenUtil → makes height adapt to screen size
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

// A schedule timeline with hours on the left and an appointment card
// ScreenUtil → used for responsive text, padding, spacing
// ResponsiveRowColumn (from responsive_framework) → ensures adaptive layouts if used in wider/narrow screens

Widget scheduleTimeline(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16.w),
    decoration:BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [  Text(
          "11 Wednesday - Today",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          textAlign: TextAlign.right,
        ),

        // Timeline Rows
        Column(
          children: [
            _timeRow("9 AM"),
            _timeRow("10 AM", hasEvent: true, context: context),
            _timeRow("11 AM"),
            _timeRow("12 AM"),
          ],
        ),
      ],
    ),
  );
}

// A single row with time + (optional) event card
Widget _timeRow(String time, {bool hasEvent = false, BuildContext? context}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side (time)
        SizedBox(
          width: 50.w, // fixed width for alignment
          child: Text(
            time,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),

        // Right side (either dotted line or event card)
        Expanded(
          child: hasEvent
              ? _eventCard(context!)
              : Container(
                  height: 1,
                  margin: EdgeInsets.only(top: 12.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.black26, width: 1),
                    ),
                  ),
                ),
        ),
      ],
    ),
  );
}

// Event card widget
Widget _eventCard(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Texts (doctor name + description)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. Olivia Turner, M.D.",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Treatment and prevention of skin and photodermatitis.",
                style: TextStyle(fontSize: 12.sp, color: Colors.black87),
              ),
            ],
          ),
        ),

        SizedBox(width: 8.w),

        // Action buttons (✓ and ✕)
        Row(
          children: [
            _circleIcon(
              Icons.check,
              Colors.white,
              Theme.of(context).primaryColor,
            ),
            SizedBox(width: 6.w),
            _circleIcon(Icons.close, Colors.black, Colors.white),
          ],
        ),
      ],
    ),
  );
}

// Circular icon button
Widget _circleIcon(IconData icon, Color iconColor, Color bgColor) {
  return Container(
    padding: EdgeInsets.all(6.w),
    decoration: BoxDecoration(
      color: bgColor,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 4.r, offset: Offset(1, 2)),
      ],
    ),
    child: Icon(icon, size: 14.sp, color: iconColor),
  );
}
