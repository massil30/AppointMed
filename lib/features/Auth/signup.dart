import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/textfield.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/utils/theme_extention.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  DateTime? selectedDate;

  List<Widget> get _fields {
    return [
      // Title
      Text(
        "Create Account",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: context.primary,
        ),
      ),
      const SizedBox(height: 4),
      Center(
        child: Text(
          "Please fill in the details to create an account.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
        ),
      ),
      const SizedBox(height: 32),

      // Full Name
      CustomTextField(
        controller: fullNameController,
        label: "Full Name",
        hint: "Enter your full name",
        keyboardType: TextInputType.name,
      ),
      const SizedBox(height: 20),

      // Email
      CustomTextField(
        controller: emailController,
        label: "Email",
        hint: "example@email.com",
        keyboardType: TextInputType.emailAddress,
      ),
      const SizedBox(height: 20),

      // Phone Number
      CustomTextField(
        controller: phoneController,
        label: "Phone Number",
        hint: "Enter your phone number",
        keyboardType: TextInputType.phone,
      ),
      const SizedBox(height: 20),

      // Date of Birth
      Text(
        "Date of Birth",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 8),
      GestureDetector(
        onTap: () => _selectDate(context),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xffECF1FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            selectedDate == null
                ? "Select your date of birth"
                : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
            style: TextStyle(
              color: selectedDate == null
                  ? const Color(0xff809CFF)
                  : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),

      // Password
      CustomTextField(
        controller: passwordController,
        label: "Password",
        hint: "Enter your password",
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ),
      const SizedBox(height: 20),

      // Confirm Password
      CustomTextField(
        controller: confirmPasswordController,
        label: "Confirm Password",
        hint: "Re-enter your password",
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ),
      const SizedBox(height: 32),

      Center(
        child: CustomButton(
          text: 'Sign Up',
          onPressed: () {
            // Handle sign up
          },
          width: MediaQuery.of(context).size.width - 180,
          height: 50,
        ),
      ),
      const SizedBox(height: 30),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account? ",
            style: GoogleFonts.poppins(fontSize: 13),
          ),
          GestureDetector(
            onTap: () {
              context.push(RouteNames.login);
            },
            child: Text(
              "Log In",
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    ];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Sign Up"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: ListView.builder(
            itemCount: _fields.length,
            itemBuilder: (context, index) => _fields[index],
          ),
        ),
      ),
    );
  }
}
