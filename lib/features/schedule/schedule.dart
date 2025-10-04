import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/theme_extention.dart';
import 'package:responsivity/components/textfield.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/features/schedule/schedule_widget.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  // For month dropdown
  String selectedMonth = "Month";

  // For days list
  final days = [
    {"day": "MON", "num": "22"},
    {"day": "TUE", "num": "23"},
    {"day": "WED", "num": "24", "selected": true},
    {"day": "THU", "num": "25"},
    {"day": "FRI", "num": "26"},
    {"day": "SAT", "num": "27"},
  ];

  // For time slots
  final timeSlots = [
    "9:00 AM",
    "9:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 M",
    "12:30 M",
    "1:00 PM",
    "1:30 PM",
    "2:00 PM",
    "2:30 PM",
    "3:00 PM",
    "3:30 PM",
    "4:00 PM",
  ];
  String selectedTimeSlot = "10:00 AM";

  // For patient type selection
  final patientTypes = ["Yourself", "Another Person"];
  String selectedPatientType = "Another Person";

  // For gender selection
  final genders = ["Male", "Female", "Other"];
  String selectedGender = "Female";

  void selectDay(int index) {
    setState(() {
      for (var day in days) {
        day.remove("selected");
      }
      days[index]["selected"] = true;
    });
  }

  void selectTimeSlot(String time) {
    setState(() {
      selectedTimeSlot = time;
    });
  }

  void selectPatientType(String type) {
    setState(() {
      selectedPatientType = type;
    });
  }

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Schedule Appointment"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top container with dropdown and days list
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(color: context.secondary),
              child: Column(
                children: [
                  // Month dropdown
                  monthDropdownSelector(context, selectedMonth, (newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedMonth = newValue;
                      });
                    }
                  }),

                  SizedBox(height: 4.h),

                  // Days horizontal list
                  daysHorizontalList(context, days, selectDay),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            // Available Time text
            sectionTitle(context, "Available Time"),

            SizedBox(height: 12.h),

            // Time slots wrap
            timeSlotSelector(
              context,
              timeSlots,
              selectedTimeSlot,
              selectTimeSlot,
            ),

            SizedBox(height: 24.h),

            // Divider
            sectionDivider(context),

            SizedBox(height: 12.h),

            // Patient Details text
            sectionTitle(context, "Patient Details"),

            SizedBox(height: 12.h),

            // Patient type selection
            patientTypeSelector(
              context,
              patientTypes,
              selectedPatientType,
              selectPatientType,
            ),

            SizedBox(height: 16.h),

            // Full Name field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomTextField(
                label: "Full Name",
                hint: "Enter your full name",
              ),
            ),

            SizedBox(height: 16.h),

            // Age field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomTextField(
                label: "Age",
                hint: "Enter your age",
                keyboardType: TextInputType.number,
              ),
            ),

            SizedBox(height: 16.h),

            // Gender text
            sectionTitle(context, "Gender"),

            SizedBox(height: 8.h),

            // Gender selection
            genderSelector(context, genders, selectedGender, selectGender),

            SizedBox(height: 16.h),

            // Divider
            sectionDivider(context),

            SizedBox(height: 16.h),

            // Problem description field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomTextField(
                label: "Describe Your Problem",
                hint: "Enter details about your condition",
                maxLines: 4,
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
