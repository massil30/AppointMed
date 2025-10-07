import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/network_image_widget.dart';
import 'package:responsivity/utils/theme_extention.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/config/routes/routesName.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;
  final int rating;
  final int reviews;

  const DoctorCard({
    Key? key,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    this.rating = 0,
    this.reviews = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RouteNames.doctors_details);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16.sp),
        padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 12.sp),
        decoration: BoxDecoration(
          color: context.secondary, // background = soft primary
          borderRadius: BorderRadius.circular(17.sp),
        ),
        child: Row(
          children: [
            // Doctor Image
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 64,
                  height: 64,
                  color: Colors.grey[200],
                  child: const Icon(Icons.person),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 64,
                  height: 64,
                  color: Colors.grey[200],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Doctor Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13.sp),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: context.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          specialty,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Ratings + Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _infoChip(Icons.star, "$rating"),
                          const SizedBox(width: 6),
                          _infoChip(Icons.chat_bubble_outline, "$reviews"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _circleIcon(Icons.help_outline),
                          const SizedBox(width: 6),
                          _circleIcon(Icons.favorite, color: Colors.blue),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Action buttons (icons on the right)
          ],
        ),
      ),
    );
  }

  /// Small rounded info chips (⭐ 5, 💬 60)
  Widget _infoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.blue),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.blue, fontSize: 13)),
        ],
      ),
    );
  }

  /// Small circular action buttons (❓ ❤️)
  Widget _circleIcon(IconData icon, {Color color = Colors.black54}) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.white,
      child: Icon(icon, size: 18, color: color),
    );
  }
}
