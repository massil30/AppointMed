import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/theme_extention.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final Color backgroundcolor;
  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.backgroundcolor = const Color(0xFFFBFBFE),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.sp,
          color: context.primary,
        ),
      ),
      backgroundColor: backgroundcolor,
      leading: Container(
        margin: const EdgeInsets.only(left: 24),
        child: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios, color: context.primary),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
