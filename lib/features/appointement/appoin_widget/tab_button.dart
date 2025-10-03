import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/features/appointement/appoi_cards.dart';
import 'package:responsivity/features/appointement/data_appoin.dart';
import 'package:responsivity/utils/theme_extention.dart';

// Custom Tab Button
class AppointmentTabButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;
  const AppointmentTabButton({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF2196F3) : const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF2196F3),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
