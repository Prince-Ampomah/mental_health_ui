import 'package:flutter/material.dart';
import 'package:mental_health_ui/features/assistant/models/doctor_model.dart';

class DoctorDetailParams {
  final DoctorModel doctor;

  DoctorDetailParams({required this.doctor});
}

class DoctorDetailPage extends StatelessWidget {
  final DoctorDetailParams params;

  const DoctorDetailPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(params.doctor.name)));
  }
}
