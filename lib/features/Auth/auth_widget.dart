import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthFooter extends StatelessWidget {
  final String normalText;
  final String actionText;
  final VoidCallback onActionTap;
  final Color actionColor;
  final double fontSize;

  const AuthFooter({
    super.key,
    required this.normalText,
    required this.actionText,
    required this.onActionTap,
    this.actionColor = Colors.blue,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(normalText, style: GoogleFonts.poppins(fontSize: fontSize)),
        GestureDetector(
          onTap: onActionTap,
          child: Text(
            actionText,
            style: GoogleFonts.poppins(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: actionColor,
            ),
          ),
        ),
      ],
    );
  }
}

// Select Another way to Login

class Login3edParty extends StatelessWidget {
  const Login3edParty({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialButton(Icons.g_mobiledata, Colors.red),
        const SizedBox(width: 16),
        _socialButton(Icons.facebook, Colors.blue),
        const SizedBox(width: 16),
        _socialButton(Icons.fingerprint, Colors.green),
      ],
    );
  }

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
