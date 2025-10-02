import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/components/searchfield.dart';
import 'package:responsivity/pages/helpCenter/widgets/toggleC.dart';
import 'package:responsivity/utils/responsivity.dart';
import 'package:responsivity/utils/theme_extention.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  int selectedTab = 0;
  int selectedCategory = 0;
  List<String> tabs = ["FAQ", "Contact Us"];
  List<String> categories = ["Topics", "General", "Services"];
  List<bool> expanded = List.generate(8, (index) => index == 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Section with background
            Container(
              width: double.infinity,
              color: context.primary,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // AppBar Row
                  Row(
                    children: [
                      InkWell(
                        onTap: () => context.pop(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        "Help Center",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "How Can We Help You?",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SearchField(
                    hintText: "Search...",
                    width: double.infinity,
                    suffixIcon: Icon(Icons.search),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 18.h),

                  // Tab Buttons
                ],
              ),
            ),
            SizedBox(height: 16.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: List.generate(tabs.length, (i) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: CustomButton(
                        fontSize: 20.sp,
                        text: tabs[i],
                        onPressed: () {
                          setState(() {
                            selectedTab = i;
                          });
                        },
                        backgroundColor: selectedTab == i
                            ? context.primary
                            : context.secondary,
                        textColor: selectedTab == i
                            ? Colors.white
                            : context.primary,
                        height: 40.sp,
                        width: MediaSize.width / 4 - 16.w,
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 12.h),
            // Category Buttons
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: List.generate(categories.length, (i) {
                return CustomButton(
                  width: MediaSize.width / 3 - 16.sp,
                  text: categories[i],
                  onPressed: () {
                    setState(() {
                      selectedCategory = i;
                    });
                  },
                  backgroundColor: selectedTab == i
                      ? context.primary
                      : context.secondary,
                  textColor: selectedTab == i ? Colors.white : context.primary,
                  height: 40.h,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                );
              }),
            ),
            // Toggle List Section
            Expanded(child: toggle_list()),
          ],
        ),
      ),
    );
  }

  LayoutBuilder toggle_list() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool canFitTwo = constraints.maxWidth >= 800;
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                for (var i = 0; i < 8; i++)
                  SizedBox(
                    width: canFitTwo
                        ? (constraints.maxWidth / 2.5) -
                              12 // 2 per row
                        : constraints.maxWidth,
                    child: toggleTile(i, context, isWide: canFitTwo),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
