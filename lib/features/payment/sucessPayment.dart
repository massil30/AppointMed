// Example for c:\Users\ABC\Desktop\responsivity\lib\features\payment\payment_method.dart
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Method")),
      body: const Center(child: Text("Payment Method Page")),
    );
  }
}