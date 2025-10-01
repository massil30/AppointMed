import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/utils/network_image_widget.dart';
import 'package:responsivity/utils/theme_extention.dart';

class PorfilePage extends StatefulWidget {
  const PorfilePage({super.key});

  @override
  State<PorfilePage> createState() => _PorfilePageState();
}

class _PorfilePageState extends State<PorfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "My Profile"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Profile picture with edit icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: InkWell(
                    onTap: () {
                      context.push(RouteNames.editProfile);
                      // Handle edit profile picture action
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, color: Colors.blue, size: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "John Doe",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),

            // Profile options
            _ProfileTile(icon: Icons.person, label: "Profile"),
            _ProfileTile(icon: Icons.favorite, label: "Favorite"),
            _ProfileTile(icon: Icons.credit_card, label: "Payment Method"),
            _ProfileTile(icon: Icons.privacy_tip, label: "Privacy Policy"),
            _ProfileTile(icon: Icons.settings, label: "Settings"),
            _ProfileTile(icon: Icons.help_outline, label: "Help"),
            _ProfileTile(icon: Icons.logout, label: "Logout"),
            SizedBox(height: 100.sp),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ProfileTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: context.secondary,
        child: Icon(icon, color: context.primary),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: context.primary,
        ),
      ),
      trailing: label == "Logout"
          ? null
          : Icon(Icons.chevron_right, color: context.secondary),
      onTap: () {},
    );
  }
}
