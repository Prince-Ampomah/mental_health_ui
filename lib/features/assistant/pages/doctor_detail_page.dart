import 'package:flutter/material.dart';
import 'package:mental_health_ui/features/assistant/models/doctor_model.dart';
import 'package:mental_health_ui/features/assistant/sections/doctor_header_section.dart';
import 'package:mental_health_ui/features/assistant/sections/doctor_info_section.dart';
import 'package:mental_health_ui/features/assistant/sections/doctor_calendar_section.dart';
import 'package:mental_health_ui/features/assistant/sections/doctor_message_section.dart';

class DoctorDetailParams {
  final DoctorModel doctor;
  const DoctorDetailParams({required this.doctor});
}

class DoctorDetailPage extends StatelessWidget {
  final DoctorDetailParams params;

  const DoctorDetailPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final doctor = params.doctor;

    // Full-screen page pushed via Navigator — has its own Scaffold
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4F4),
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pink banner + photo + back button
                  DoctorHeaderSection(doctor: doctor),

                  // Name, specialty, rating
                  DoctorInfoSection(doctor: doctor),

                  // Month navigator + available day chips
                  DoctorCalendarSection(doctor: doctor),
                ],
              ),
            ),
          ),

          // Message bar pinned at the bottom
          DoctorMessageSection(),
        ],
      ),
    );
  }
}
