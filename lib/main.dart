import 'package:flutter/cupertino.dart';
import 'package:responsivity/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Cupertino Demo',
      home: Test(),
    );
  }
}
