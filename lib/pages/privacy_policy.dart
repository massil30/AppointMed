import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/utils/theme_extention.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Privacy Policy"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Last Update
              Text(
                "Last Update: 14/08/2024",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              // Privacy Policy Text
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam. Fusce a scelerisque neque, sed accumsan metus.\n\n"
                "Nunc auctor tortor in dolor luctus, quis euismod urna tincidunt. Aenean arcu metus, bibendum at rhoncus at, volutpat ut lacus. Morbi pellentesque malesuada eros semper ultrices. Vestibulum lobortis enim vel neque auctor, a ultrices ex placerat. Mauris ut lacinia justo, sed suscipit tortor. Nam egestas nulla posuere neque tincidunt porta.",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w200,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              // Terms & Conditions Title
              Text(
                "Terms & Conditions",
                style: TextStyle(
                  color: context.primary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              // Terms List
              const _TermsList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TermsList extends StatelessWidget {
  const _TermsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _numberedTerm(
          1,
          "Ut lacinia justo sit amet lorem sodales accumsan. Proin malesuada eleifend fermentum. Donec condimentum, nunc at rhoncus faucibus, ex nisi laoreet ipsum, eu pharetra eros est vitae orci. Morbi quis rhoncus mi. Nullam lacinia ornare accumsan. Duis laoreet, ex eget rutrum pharetra, lectus nisl posuere risus, vel facilisis nisi tellus ac turpis.",
        ),
        const SizedBox(height: 12),
        _numberedTerm(
          2,
          "Ut lacinia justo sit amet lorem sodales accumsan. Proin malesuada eleifend fermentum. Donec condimentum, nunc at rhoncus faucibus, ex nisi laoreet ipsum, eu pharetra eros est vitae orci. Morbi quis rhoncus mi. Nullam lacinia ornare accumsan. Duis laoreet, ex eget rutrum pharetra, lectus nisl posuere risus, vel facilisis nisi tellus ac turpis.",
        ),
      ],
    );
  }

  Widget _numberedTerm(int number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$number. ",
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w200,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
