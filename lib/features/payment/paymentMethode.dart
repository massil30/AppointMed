import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/config/routes/routesName.dart';
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
                  child: PaymentOptionTile(
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

class PaymentOptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const PaymentOptionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: context.secondary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: selected
            ? Border.all(color: Theme.of(context).primaryColor, width: 2)
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, size: 22.sp, color: Theme.of(context).primaryColor),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: selected ? Theme.of(context).primaryColor : Colors.black,
              ),
            ),
          ),
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: Theme.of(context).primaryColor,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}
