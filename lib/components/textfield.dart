import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hint;

  const EmailField({
    super.key,
    this.controller,
    this.label = "Email or Mobile Number",
    this.hint = "example@example.com",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xff809CFF), fontSize: 18),
            filled: true,
            fillColor: const Color(0xffECF1FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
