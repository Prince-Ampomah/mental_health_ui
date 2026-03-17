import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/features/assistant/models/doctor_model.dart';

class DoctorHeaderSection extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorHeaderSection({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── Banner background with gradient ──
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    doctor.headerColor.withAlpha(255),
                    doctor.headerColor.withAlpha(180),
                    const Color(0xFFE8B4D0),
                  ],
                ),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(36),
                ),
              ),
            ),
          ),

          // ── Decorative blob/circle behind the doctor photo ──
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withAlpha(40),
              ),
            ),
          ),

          // ── Second blob for depth ──
          Positioned(
            right: 20,
            top: 20,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withAlpha(30),
              ),
            ),
          ),

          // ── Doctor photo — right side, fills most of the banner ──
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(36),
              ),
              child: SizedBox(
                width: 200,
                child: doctor.imagePath.isNotEmpty
                    ? Image.asset(
                        doctor.imagePath,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      )
                    // Placeholder: tinted silhouette until real images added
                    : Container(
                        color: Colors.transparent,
                        child: Icon(
                          Icons.person,
                          size: 140,
                          color: Colors.white.withAlpha(120),
                        ),
                      ),
              ),
            ),
          ),

          // ── Top bar: back button + profile icon ──
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(230),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(15),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    // Profile/contact icon
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(230),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(15),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.account_circle_outlined,
                        size: 25,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── "Health Brain Assistant" large title ──
          Positioned(
            bottom: 72,
            left: 24,
            right: 210, // Don't overlap photo
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Health',
                  style: AppTextStyles.headline2.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    height: 1.1,
                  ),
                ),
                Text(
                  'Brain',
                  style: AppTextStyles.headline2.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.1,
                  ),
                ),
                Text(
                  'Assistant',
                  style: AppTextStyles.headline2.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),

          // ── "Heal your mind" pill tag ──
          Positioned(
            bottom: 26,
            left: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(210),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Text(
                'Heal your mind',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
