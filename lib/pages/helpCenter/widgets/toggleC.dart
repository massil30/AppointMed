import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget toggleTile(int index, dynamic context, {bool isWide = false}) {
  List<bool> expanded = List.generate(8, (index) => index == 0);

  return Card(
    margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.sp),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
    color: const Color(0xFFF5F8FF), // background of header/title
    child: ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
      childrenPadding: EdgeInsets.zero,
      title: Text(
        "Lorem ipsum dolor sit amet?",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      ),
      trailing: Icon(
        expanded[index] ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        color: Colors.blue,
      ),
      initiallyExpanded: expanded[index],
      onExpansionChanged: (val) {},
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white, // 👈 white background only for content
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18.r), // keep bottom corners rounded
            ),
          ),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Praesent pellentesque congue lorem, vel tincidunt tortor "
            "placerat a. Proin ac diam quam. Aenean in sagittis magna, "
            "ut feugiat diam.",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13.sp,
              height: 1.5,
            ),
          ),
        ),
      ],
    ),
  );
}
