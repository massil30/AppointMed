import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/theme_extention.dart';

class SearchField extends StatelessWidget {
  final double? width;
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    this.width,
    this.controller,
    this.hintText = "",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: context.secondary,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.filter_list, color: Colors.black),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: TextStyle(
                color: Colors.black, // Writing style is black
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: context.primary.withOpacity(0.7),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                suffixIcon: Icon(Icons.search, color: context.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
