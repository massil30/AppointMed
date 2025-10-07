import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/theme_extention.dart';

Future<String?> showLanguageDialog(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: true,
    builder: (_) => Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select Language",
              style: TextStyle(
                color: context.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 24.h),

            // English Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, 'en'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE6EEFF),
                  foregroundColor: context.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  elevation: 0,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    "English",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // French Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, 'fr'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE6EEFF),
                  foregroundColor: context.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  elevation: 0,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    "Français",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
