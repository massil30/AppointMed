import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/textfield.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/utils/common.dart';

class CancelAppointmentPage extends StatefulWidget {
  const CancelAppointmentPage({super.key});

  @override
  State<CancelAppointmentPage> createState() => _CancelAppointmentPageState();
}

class _CancelAppointmentPageState extends State<CancelAppointmentPage> {
  int selectedChip = 0;
  final TextEditingController reasonController = TextEditingController();

  final List<String> reasons = [
    "Feeling Better",
    "Found Another Doctor",
    "Reschedule",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Cancel Appointment"),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Are you sure you want to cancel your appointment?",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 18.h),
              ...List.generate(reasons.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedChip = index;
                    });
                  },
                  child: OptionTile(
                    label: reasons[index],
                    selected: selectedChip == index,
                  ),
                );
              }),
              SizedBox(height: 24.h),

              CustomTextField(
                controller: reasonController,
                hint: "Write your reason...",
                label: "Reason",
                maxLines: 4,
              ),
              SizedBox(height: 32.h),
              CustomButton(
                text: "Cancel Appointment",
                onPressed: () {
                  // Handle cancel logic
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
