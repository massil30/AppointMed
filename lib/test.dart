import 'package:flutter/material.dart';
import 'package:responsivity/utils/theme_extention.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Width: $width',
            style: TextStyle(color: context.primary),
          ),
        ),
      ),
    );
  }
}
