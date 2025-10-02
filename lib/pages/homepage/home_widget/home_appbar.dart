import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/features/noteficaiton/notefication.dart';
import 'package:responsivity/utils/network_image_widget.dart';
import 'package:responsivity/utils/theme_extention.dart';

Row home_appbar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            width: 40.sp,
            height: 40.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('url'),
                fit: BoxFit.cover,
              ),
            ),
            child: FittedBox(
              child: NetworkImageWidget(
                imageUrl:
                    'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, WelcomeBack",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 12.sp,
                  color: context.primary,
                ),
              ),
              Text(
                "John Doe",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
              ),
            ],
          ),
        ],
      ),
      CircleAvatar(
        backgroundColor: context.secondary,
        child: FittedBox(
          child: IconButton(
            onPressed: () {
              context.push(RouteNames.notification);
            },
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black,
              size: 24.sp,
            ),
          ),
        ),
      ),
    ],
  );
}
