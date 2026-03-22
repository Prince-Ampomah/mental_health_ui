import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/resources/resources.dart';

class DoctorModel {
  final String name;
  final String specialty;
  final double rating;
  final String imagePath;
  final List<String> availableDays;
  final Color headerColor;
  final bool isAvailableToday;
  final int reviewCount;
  final String experience;

  DoctorModel({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.imagePath,
    required this.availableDays,
    required this.headerColor,
    this.isAvailableToday = false,
    required this.reviewCount,
    required this.experience,
  });
}

final List<String> doctorSpecialtyFilters = [
  'All',
  'Psychologist',
  'Therapist',
  'Counselor',
  'Psychiatrist',
];

final List<DoctorModel> doctors = [
  DoctorModel(
    name: 'Dr. Sam Kartner',
    specialty: 'Psychologist',
    rating: 4.6,
    imagePath: Images.doctor2,
    availableDays: ['Thr 16', 'Thr 17', 'Thr 20', 'Mon 17', 'Tue 18', 'Wed 19'],
    headerColor: const Color(0xFFEFCAE9),
    isAvailableToday: true,
    reviewCount: 128,
    experience: '8 years',
  ),
  DoctorModel(
    name: 'Dr. James Okafor',
    specialty: 'Therapist',
    rating: 4.8,
    imagePath: Images.doctor1,
    availableDays: ['Thr 17', 'Thr 19', 'Mon 23', 'Wed 27'],
    headerColor: const Color(0xFF3FA7A3),
    isAvailableToday: false,
    reviewCount: 204,
    experience: '12 years',
  ),
  DoctorModel(
    name: 'Dr. Amara Nwosu',
    specialty: 'Counselor',
    rating: 4.5,
    imagePath: Images.doctor2,
    availableDays: ['Thr 16', 'Thr 18', 'Thr 19'],
    headerColor: const Color(0xFFD4C5F9),
    isAvailableToday: true,
    reviewCount: 89,
    experience: '5 years',
  ),
  DoctorModel(
    name: 'Dr. Lena Fischer',
    specialty: 'Psychiatrist',
    rating: 4.9,
    imagePath: Images.doctor,
    availableDays: ['Thr 18', 'Thr 19'],
    headerColor: const Color(0xFFFFD6A5),
    isAvailableToday: false,
    reviewCount: 317,
    experience: '15 years',
  ),
  DoctorModel(
    name: 'Dr. Carlos Mejia',
    specialty: 'Psychologist',
    rating: 4.3,
    imagePath: Images.doctor2,
    availableDays: ['Thr 16', 'Thr 17'],
    headerColor: const Color(0xFFC8E6C9),
    isAvailableToday: true,
    reviewCount: 76,
    experience: '6 years',
  ),
];
