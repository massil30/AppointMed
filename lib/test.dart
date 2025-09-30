import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/responsivity.dart';
import 'package:responsivity/utils/theme_extention.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final List<Map<String, String>> doctors = [
    {"name": "Dr. Ahmed", "specialty": "Cardiologist"},
    {"name": "Dr. Sarah", "specialty": "Dermatologist"},
    {"name": "Dr. Karim", "specialty": "Neurologist"},
    {"name": "Dr. Amina", "specialty": "Pediatrician"},
    {"name": "Dr. Ali", "specialty": "Orthopedic"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Doctors")),
      body: ResponsiveLayout(
        // 📱 Mobile → ListView
        mobile: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return DoctorCard(
              name: doctor["name"]!,
              specialty: doctor["specialty"]!,
              imageUrl:
                  'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
              rating: 5,
              reviews: 60,
            );
          },
        ),

        // 💻 Tablet/Desktop → GridView
        tablet: LayoutBuilder(
          builder: (context, constraints) {
            bool canFitTwo = constraints.maxWidth >= 900;
            return Wrap(
              children: [
                for (var doctor in doctors)
                  SizedBox(
                    width: canFitTwo
                        ? (constraints.maxWidth / 2) -
                              15 // 2 per row
                        : constraints.maxWidth,
                    child: DoctorCard(
                      name: doctor["name"]!,
                      specialty: doctor["specialty"]!,
                      imageUrl:
                          'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                      rating: 5,
                      reviews: 60,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16.sp),
      padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 12.sp),
      decoration: BoxDecoration(
        color: context.secondary, // background = soft primary
        borderRadius: BorderRadius.circular(17.sp),
      ),
      child: Row(
        children: [
          // Doctor Image
          CircleAvatar(radius: 32, backgroundImage: NetworkImage(imageUrl)),
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
