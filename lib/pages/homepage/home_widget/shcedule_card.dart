// This widget builds a horizontal list of day containers
// Uses ScreenUtil for responsive padding, radius, text sizes
// Uses ResponsiveRowColumn from responsive_framework for consistent scaling

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/responsivity.dart';
import 'package:responsivity/utils/theme_extention.dart';

// A schedule timeline with hours on the left and an appointment card
// ScreenUtil → used for responsive text, padding, spacing
// ResponsiveRowColumn (from responsive_framework) → ensures adaptive layouts if used in wider/narrow screens

Widget scheduleTimeline(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "11 Wednesday - Today",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.right,
          ),
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
    padding: EdgeInsets.symmetric(vertical: 2.h),
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
    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
    decoration: BoxDecoration(
      color: context.secondary,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Texts (doctor name + description)
        Flexible(
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
              Text(
                "Treatment and prevention of skin and photodermatitis.",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black87,
                  height: 1.0,
                ),
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
