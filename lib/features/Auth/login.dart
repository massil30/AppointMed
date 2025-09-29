import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/textfield.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/utils/theme_extention.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: " Log In"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Title
              Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: context.primary,
                ),
              ),

              const SizedBox(height: 4),

              // Welcome Text
              Center(
                child: Text(
                  "Welcome back! Please log in to continue.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Email Field (reusable)
              const CustomTextField(),

              const SizedBox(height: 20),

              // Password Field
              Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "********",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_off),
                    onPressed: () {},
                  ),
                  filled: true,
                  hintStyle: const TextStyle(
                    color: Color(0xff809CFF),
                    fontSize: 18,
                  ),
                  fillColor: const Color(0xffECF1FF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Login Button
              Center(
                child: CustomButton(
                  text: 'Log In',
                  onPressed: () {},
                  width: MediaQuery.of(context).size.width - 180,
                  height: 50,
                ),
              ),

              const SizedBox(height: 32),

              // OR Divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "or sign in with",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 20),

              // Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton(Icons.g_mobiledata, Colors.red),
                  const SizedBox(width: 16),
                  _socialButton(Icons.facebook, Colors.blue),
                  const SizedBox(width: 16),
                  _socialButton(Icons.fingerprint, Colors.green),
                ],
              ),

              const SizedBox(height: 30),

              // Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(RouteNames.signup);
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Social Button
  Widget _socialButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.1),
      ),
      child: Icon(icon, size: 28, color: color),
    );
  }
}
