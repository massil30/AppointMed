import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/utils/common.dart';
import 'package:responsivity/utils/theme_extention.dart';

class Paymentmethode extends StatefulWidget {
  const Paymentmethode({super.key});

  @override
  State<Paymentmethode> createState() => _PaymentmethodeState();
}

class _PaymentmethodeState extends State<Paymentmethode> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> paymentOptions = [
    {"icon": Icons.credit_card, "label": "Add New Card"},
    {"icon": Icons.apple, "label": "Apple Pay"},
    {"icon": Icons.payment, "label": "Paypal"},
    {"icon": Icons.android, "label": "Google Play"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Method'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              Text(
                "Credit & Debit Card",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12.h),

              // Payment Options List
              ...List.generate(paymentOptions.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: OptionTile(
                    icon: paymentOptions[index]["icon"],
                    label: paymentOptions[index]["label"],
                    selected: selectedIndex == index,
                  ),
                );
              }),

              SizedBox(height: 60.h),

              // Custom Select Button
              CustomButton(
                text: "Select",
                onPressed: () {
                  context.push(RouteNames.addCard);
                },
                width: double.infinity,
                height: 48.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
