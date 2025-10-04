import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/responsivity.dart';
import 'package:responsivity/utils/theme_extention.dart';

// Widget for the month dropdown selector
Widget monthDropdownSelector(
  BuildContext context,
  String selectedMonth,
  Function(String?) onChanged,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    child: Align(
      alignment: Alignment.topLeft,

      child: DropdownButtonHideUnderline(
        child: Container(
          width: MediaSize.width / 3.5,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: DropdownButton<String>(
            value: selectedMonth,
            style: TextStyle(
              color: context.primary,
              fontWeight: FontWeight.w500,
            ),
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down, color: context.primary),
            items: <String>["Month", "January", "February", "March", "April"]
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    ),
  );
}

// Widget for the horizontal day list
Widget daysHorizontalList(
  BuildContext context,
  List<Map<String, dynamic>> days,
  Function(int) onDaySelected,
) {
  return SizedBox(
    height: 80.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: days.length,
      itemBuilder: (context, index) {
        final isSelected = days[index].containsKey("selected");
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: GestureDetector(
            onTap: () => onDaySelected(index),
            child: Container(
              width: 60.w,
              decoration: BoxDecoration(
                color: isSelected ? context.primary : Colors.white,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    days[index]["num"] ?? "",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    days[index]["day"] ?? "",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

// Widget for time slot selection
Widget timeSlotSelector(
  BuildContext context,
  List<String> timeSlots,
  String selectedTimeSlot,
  Function(String) onTimeSelected,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    child: Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: timeSlots.map((time) {
        final isSelected = time == selectedTimeSlot;
        return GestureDetector(
          onTap: () => onTimeSelected(time),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected ? context.primary : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              time,
              style: TextStyle(
                fontSize: 12.sp,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

// Widget for section title
Widget sectionTitle(BuildContext context, String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: context.primary,
      ),
    ),
  );
}

// Widget for section divider
Widget sectionDivider(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    child: Divider(color: context.primary.withOpacity(0.3)),
  );
}

// Widget for patient type selection
Widget patientTypeSelector(
  BuildContext context,
  List<String> patientTypes,
  String selectedType,
  Function(String) onTypeSelected,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    child: Row(
      children: patientTypes.map((type) {
        final isSelected = type == selectedType;
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: GestureDetector(
            onTap: () => onTypeSelected(type),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? context.primary : Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey.shade300,
                ),
              ),
              child: Text(
                type,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

// Widget for gender selection
Widget genderSelector(
  BuildContext context,
  List<String> genders,
  String selectedGender,
  Function(String) onGenderSelected,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    child: Row(
      children: genders.map((gender) {
        final isSelected = gender == selectedGender;
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: GestureDetector(
            onTap: () => onGenderSelected(gender),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? context.primary : Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey.shade300,
                ),
              ),
              child: Text(
                gender,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
