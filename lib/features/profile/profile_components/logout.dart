import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/utils/theme_extention.dart';

Future<void> showLogoutBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28.sp)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Logout",
              style: TextStyle(
                color: context.primary,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "are you sure you want to log out?",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Cancel",
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: context.secondary,
                    textColor: context.primary,
                    fontSize: 20.sp,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    text: "Yes, Logout",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: context.primary,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
