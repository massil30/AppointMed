import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/utils/theme_extention.dart';

class OptionTile extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool selected;

  const OptionTile({
    super.key,
    this.icon,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: selected ? Colors.white : context.secondary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: selected
            ? Border.all(color: Theme.of(context).primaryColor, width: 2)
            : null,
      ),
      child: Row(
        children: [
          icon != null
              ? Icon(icon, size: 22.sp, color: Theme.of(context).primaryColor)
              : SizedBox(),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: selected ? Theme.of(context).primaryColor : Colors.black,
              ),
            ),
          ),
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: Theme.of(context).primaryColor,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}
