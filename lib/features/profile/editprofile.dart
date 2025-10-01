import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/textfield.dart';
import 'package:responsivity/components/buttons.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController(
    text: "John Doe",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "+123 567 89000",
  );
  final TextEditingController emailController = TextEditingController(
    text: "johndoe@example.com",
  );
  final TextEditingController dobController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            // Profile picture with edit icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage(
                    'assets/images/profile.png',
                  ), // Replace with your asset or network image
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.edit, color: Colors.blue, size: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Full Name
            const SizedBox(height: 8),
            CustomTextField(
              controller: nameController,
              hint: "Full Name",
              label: "Full Name",
            ),
            const SizedBox(height: 16),

            // Phone Number
            const SizedBox(height: 8),
            CustomTextField(
              controller: phoneController,
              hint: "Phone Number",
              label: "Phone Number",
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            // Email
            const SizedBox(height: 8),
            CustomTextField(
              controller: emailController,
              hint: "Email",
              label: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Date of Birth
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Date Of Birth",
                style: TextStyle(fontSize: 20.sp, color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
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
            if (selectedDate == null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                child: Text(
                  "Please select your date of birth",
                  style: TextStyle(color: Colors.red[700], fontSize: 12),
                ),
              ),
            const SizedBox(height: 32),

            CustomButton(
              text: "Update Profile",
              onPressed: () {
                // Handle update
              },
              width: double.infinity,
              height: 50,
            ),
          ],
        ),
      ),
    );
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
}
