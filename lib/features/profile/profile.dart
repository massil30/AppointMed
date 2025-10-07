import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/config/language/languageDialog.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/features/profile/profile_components/logout.dart';
import 'package:responsivity/utils/theme_extention.dart';
import 'package:responsivity/config/theme.dart';

class PorfilePage extends StatefulWidget {
  const PorfilePage({super.key});

  @override
  State<PorfilePage> createState() => _PorfilePageState();
}

class _PorfilePageState extends State<PorfilePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            SizedBox(height: 24),

            // Profile options
            profileTile(icon: Icons.person, label: "Profile", context: context),
            profileTile(
              icon: Icons.favorite,
              label: "Favorite",
              context: context,
              onTap: () => context.push(RouteNames.favorite),
            ),
            profileTile(
              onTap: () => showLanguageDialog(context),
              icon: Icons.language,
              label: "Select Language",
              context: context,
            ),
            profileTile(
              icon: Icons.privacy_tip,
              label: "Privacy Policy",
              context: context,
              onTap: () => context.push(RouteNames.privacyPolicy),
            ),
            // Dark Mode toggle switch
            ListTile(
              dense: false,
              leading: CircleAvatar(
                backgroundColor: context.secondary,
                child: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: context.primary,
                ),
              ),
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: context.primary,
                ),
              ),
              trailing: SizedBox(
                height: 40,
                width: 60,
                child: FittedBox(
                  child: Switch(
                    value: isDarkMode,
                    activeColor: context.primary,
                    onChanged: (bool value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
                ),
              ),
            ),
            profileTile(
              icon: Icons.help_outline,
              label: "Help",
              context: context,
              onTap: () => context.push(RouteNames.helpCenter),
            ),
            profileTile(
              icon: Icons.logout,
              label: "Logout",
              context: context,
              onTap: () => showLogoutBottomSheet(context),
            ),
            SizedBox(height: 100.sp),
          ],
        ),
      ),
    );
  }
}

Widget profileTile({
  required IconData icon,
  required String label,
  required BuildContext context,
  VoidCallback? onTap,
}) {
  {
    return ListTile(
      dense: false,
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
      onTap: onTap,
    );
  }
}
