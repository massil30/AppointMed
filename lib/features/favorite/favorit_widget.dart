import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/utils/theme_extention.dart';

class Doctor_favorite_widget extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;

  const Doctor_favorite_widget({
    super.key,
    required this.name,
    required this.specialty,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RouteNames.doctors_details);
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.secondary,
          borderRadius: BorderRadius.circular(24.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 60.sp,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: context.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                  Text(
                    specialty,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  FittedBox(
                    child: Row(
                      children: [
                        CustomButton(text: 'Book Now', onPressed: () {}),
                        SizedBox(width: 16.w),
                        _doctorIconButton(
                          context,
                          Icons.favorite_border,
                          color: context.primary,
                        ),
                        SizedBox(width: 16.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _doctorActionButton(
    BuildContext context,
    String text,
    IconData icon,
    Color bg,
    Color fg,
  ) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: fg, size: 16.sp),
      label: Text(
        text,
        style: TextStyle(
          color: fg,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        elevation: 0,
      ),
    );
  }

  Widget _doctorIconButton(
    BuildContext context,
    IconData icon, {
    Color? color,
  }) {
    return CircleAvatar(
      radius: 27.r,
      backgroundColor: Colors.white,
      child: Icon(icon, color: color ?? context.primary, size: 30.r),
    );
  }
}
