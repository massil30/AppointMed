import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/config/routes/routesName.dart';

Widget buildAppointmentDetails() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
    child: Column(
      children: [
        _buildDetailRow('Date / Hour', 'Month 24, Year / 10:00 AM'),
        SizedBox(height: 12.h),
        _buildDetailRow('Duration', '30 Minutes'),
        SizedBox(height: 12.h),
        _buildDetailRow('Booking for', 'Another Person'),
      ],
    ),
  );
}

Widget buildPricingDetails() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
    child: Column(
      children: [
        _buildDetailRow('Amount', '\$100.00', valueColor: Colors.black),
        SizedBox(height: 12.h),
        _buildDetailRow('Duration', '30 Minutes'),
        SizedBox(height: 12.h),
        _buildDetailRow(
          'Total',
          '\$100',
          valueColor: Colors.black,
          valueFontWeight: FontWeight.w600,
        ),
      ],
    ),
  );
}

class build_payment_methode extends StatelessWidget {
  const build_payment_methode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Payment Method',
            style: TextStyle(fontSize: 14.sp, color: const Color(0xFF2196F3)),
          ),
          Row(
            children: [
              Text(
                'Card',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 12.w),
              InkWell(
                onTap: () => context.push(RouteNames.paymentMethod),
                child: Text(
                  'Change',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF2196F3),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildDetailRow(
  String label,
  String value, {
  Color? valueColor,
  FontWeight? valueFontWeight,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 14.sp, color: const Color(0xFF2196F3)),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 14.sp,
          color: valueColor ?? Colors.black87,
          fontWeight: valueFontWeight ?? FontWeight.w400,
        ),
      ),
    ],
  );
}
