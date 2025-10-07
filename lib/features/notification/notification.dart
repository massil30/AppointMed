import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/features/noteficaiton/nottification_widget.dart';
import 'package:responsivity/utils/theme_extention.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Notification"),
      body: ListView(
        children: [
          // News badge row
          // Today section
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Row(
              children: [
                _SectionLabel(text: "Today"),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Mark all",
                    style: TextStyle(
                      color: context.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.sp),
          NotificationTile(
            icon: Icons.calendar_today,
            title: "Scheduled Appointment",
            subtitle:
                "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            time: "2 M",
            isHighlighted: false,
          ),
          NotificationTile(
            icon: Icons.calendar_today,
            title: "Scheduled Change",
            subtitle:
                "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            time: "2 H",
            isHighlighted: true,
          ),

          NotificationTile(
            icon: Icons.description,
            title: "Medical Notes",
            subtitle:
                "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            time: "3 H",
            isHighlighted: false,
          ),
          const SizedBox(height: 18),
          // Yesterday section
          Container(
            margin: EdgeInsets.only(left: 24.sp),
            alignment: Alignment.centerLeft,
            child: _SectionLabel(text: "Yesterday"),
          ),

          NotificationTile(
            icon: Icons.calendar_today,
            title: "Scheduled Appointment",
            subtitle:
                "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            time: "1 D",
            isHighlighted: false,
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: context.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: context.primary,
          fontWeight: FontWeight.w400,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
