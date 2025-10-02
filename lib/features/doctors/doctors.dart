import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/searchfield.dart';
import 'package:responsivity/features/doctors/doctor_component.dart';
import 'package:responsivity/utils/theme_extention.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Alexander Bennett, Ph.D.",
      "specialty": "Dermato-Genetics",
      "image": "https://randomuser.me/api/portraits/men/10.jpg",
    },
    {
      "name": "Dr. Sarah Lee, M.D.",
      "specialty": "Cardiology",
      "image": "https://randomuser.me/api/portraits/women/11.jpg",
    },
    {
      "name": "Dr. Omar Khaled",
      "specialty": "Neurology",
      "image": "https://randomuser.me/api/portraits/men/12.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Doctors"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            // Search with filter icon
            Row(
              children: [
                Expanded(
                  child: SearchField(
                    hintText: "Search doctors...",
                    width: double.infinity,
                  ),
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  backgroundColor: context.primary,
                  radius: 22.sp,
                  child: Icon(Icons.filter_list, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // If screen width > 900, show GridView
                  if (constraints.maxWidth > 600) {
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 columns
                            crossAxisSpacing: 18,
                            mainAxisSpacing: 18,
                            childAspectRatio:
                                3, // adjust ratio for card width/height
                          ),
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = doctors[index];
                        return Doctor_main_card(
                          name: doctor["name"]!,
                          specialty: doctor["specialty"]!,
                          imageUrl: doctor["image"]!,
                        );
                      },
                    );
                  } else {
                    // If screen width ≤ 900, show ListView
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = doctors[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 18.h),
                          child: Doctor_main_card(
                            name: doctor["name"]!,
                            specialty: doctor["specialty"]!,
                            imageUrl: doctor["image"]!,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
