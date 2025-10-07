import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/features/appointement/appoi_cards.dart';
import 'package:responsivity/features/appointement/data_appoin.dart';
import 'package:responsivity/features/appointement/appoin_widget/tab_button.dart';
import 'package:responsivity/utils/theme_extention.dart';

class AllAppointmentsPage extends StatefulWidget {
  const AllAppointmentsPage({Key? key}) : super(key: key);

  @override
  State<AllAppointmentsPage> createState() => _AllAppointmentsPageState();
}

class _AllAppointmentsPageState extends State<AllAppointmentsPage> {
  String selectedTab = 'Complete';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'All Appointments'),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Expanded(
                child: Row(
                  children: [
                    AppointmentTabButton(
                      title: 'Complete',
                      selected: selectedTab == 'Complete',
                      onTap: () => setState(() => selectedTab = 'Complete'),
                    ),
                    SizedBox(width: 12.w),
                    AppointmentTabButton(
                      title: 'Upcoming',
                      selected: selectedTab == 'Upcoming',
                      onTap: () => setState(() => selectedTab = 'Upcoming'),
                    ),
                    SizedBox(width: 12.w),
                    AppointmentTabButton(
                      title: 'Cancelled',
                      selected: selectedTab == 'Cancelled',
                      onTap: () => setState(() => selectedTab = 'Cancelled'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(child: _buildAppointmentList()),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildAppointmentList() {
    List<Map<String, dynamic>> appointments;
    String type = selectedTab;

    if (type == 'Complete') {
      appointments = completeAppointments;
    } else if (type == 'Upcoming') {
      appointments = upcomingAppointments;
    } else {
      appointments = cancelledAppointments;
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return AppointmentCard(data: appointments[index], type: type);
      },
    );
  }
}
