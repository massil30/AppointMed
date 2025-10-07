import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/utils/theme_extention.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/config/routes/routesName.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Doctor Info"),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 8.h),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Image
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: context.secondary,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 70.r,
                          backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/men/10.jpg",
                          ),
                        ),
                        SizedBox(width: 8.sp),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // First Component
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: context.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: context.secondary,
                                      child: Icon(
                                        Icons.workspace_premium,
                                        color: context.primary,
                                        size: 18,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      "15 years\nexperience",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Second Component
                              Container(
                                padding: EdgeInsets.all(14),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: context.primary,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Flexible(
                                  child: Text(
                                    "Focus: The impact of hormonal imbalances on skin conditions, "
                                    "specializing in acne, hirsutism, and other skin disorders.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      height: 1.4,
                                    ),
                                    softWrap: true, // ✅ allows line breaks
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),

                    // Name & Specialty
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Dr. Alexander Bennett, Ph.D.",
                            style: TextStyle(
                              color: context.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            "Dermato-Genetics",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Stats Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _statChip(Icons.star, "5"),
                        SizedBox(width: 4.w),
                        _statChip(Icons.chat_bubble_outline, "40"),
                        SizedBox(width: 4.w),
                        _statChip(
                          Icons.access_time,
                          "Mon-Sat / 9:00AM - 5:00PM",
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // Action Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _mainButton(
                          context,
                          "Schedule",
                          Icons.calendar_today,
                          () {
                            context.push(RouteNames.schedule);
                          },
                        ),

                        SizedBox(width: 8.w),
                        _iconButton(context, Icons.info_outline),
                        SizedBox(width: 8.w),
                        _iconButton(context, Icons.star_border),
                        SizedBox(width: 8.w),
                        _iconButton(context, Icons.help_outline),
                        SizedBox(width: 8.w),
                        _iconButton(context, Icons.favorite_border),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: context.primary,
                    ),
                  ),
                  Text(
                    "This is the description text. It can be long, "
                    "but it will only show up to three lines max. "
                    "If it overflows, it will end with an ellipsis.",
                    maxLines: 3,
                    style: TextStyle(fontSize: 14.sp, height: 1.1),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _InfoText({
    required String title,
    required String body,
    required IconData icon,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 22.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
              if (body.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Text(
                    body,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _statChip(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: context.primary, size: 16.sp),
          SizedBox(width: 4.w),
          Text(
            text,
            style: TextStyle(
              color: context.primary,
              fontWeight: FontWeight.w300,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainButton(BuildContext context, String text, IconData icon, onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white, size: 18.sp),
      label: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: context.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        elevation: 0,
      ),
    );
  }

  Widget _iconButton(BuildContext context, IconData icon) {
    return CircleAvatar(
      radius: 16.sp,
      backgroundColor: Colors.white,
      child: Icon(icon, color: context.primary, size: 16.sp),
    );
  }
}
