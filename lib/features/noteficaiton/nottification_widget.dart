import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/theme_extention.dart';

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final bool isHighlighted;

  const NotificationTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 24.sp),
      decoration: BoxDecoration(
        color: isHighlighted ? context.secondary : null,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.sp,
          backgroundColor: const Color(0xFF4D8AFF),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 12.sp,
            fontWeight: FontWeight.w200,
            height: 1,
          ),
        ),

        trailing: Text(
          time,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
      ),
    );
  }
}
