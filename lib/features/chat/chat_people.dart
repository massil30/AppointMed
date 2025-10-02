import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/searchfield.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/features/chat/chatPage.dart';
import 'package:responsivity/utils/theme_extention.dart';

class ChatPeoplePage extends StatelessWidget {
  ChatPeoplePage({super.key});

  final List<Map<String, String>> people = [
    {
      "name": "Omar Khaled",
      "message": "Hey, how are you?",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
    },
    {
      "name": "Sarah Ahmed",
      "message": "Let's meet tomorrow.",
      "image": "https://randomuser.me/api/portraits/women/2.jpg",
    },
    {
      "name": "Ali Hassan",
      "message": "Sent the files.",
      "image": "https://randomuser.me/api/portraits/men/3.jpg",
    },
    {
      "name": "Mona Samir",
      "message": "Thank you!",
      "image": "https://randomuser.me/api/portraits/women/4.jpg",
    },
    {
      "name": "Omar Khaled",
      "message": "Hey, how are you?",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
    },
    {
      "name": "Omar Khaled",
      "message": "Hey, how are you?",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
    },
    {
      "name": "Omar Khaled",
      "message": "Hey, how are you?",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
    },
    {
      "name": "Omar Khaled",
      "message": "Hey, how are you?",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Chat"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Column(
          children: [
            SearchField(hintText: "Search...", width: double.infinity),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.separated(
                itemCount: people.length,
                separatorBuilder: (_, __) =>
                    Divider(height: 8.h, color: Colors.transparent),
                itemBuilder: (context, index) {
                  final person = people[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    leading: CircleAvatar(
                      radius: 26.sp,
                      backgroundImage: NetworkImage(person["image"]!),
                    ),
                    title: Text(
                      person["name"]!,
                      style: TextStyle(
                        color: context.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    subtitle: Text(
                      person["message"]!,
                      style: TextStyle(color: Colors.black87, fontSize: 14.sp),
                    ),
                    onTap: () {
                      context.push(RouteNames.chat);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
