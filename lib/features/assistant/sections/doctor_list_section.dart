import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/assistant/models/doctor_model.dart';
import 'package:mental_health_ui/features/assistant/widgets/doctor_card.dart';
import 'package:mental_health_ui/features/assistant/pages/doctor_detail_page.dart';
import 'package:mental_health_ui/routes/route_names.dart';

/// Returns either a SliverList of doctor cards or a SliverFillRemaining
/// empty state — consumed directly inside a CustomScrollView.
class DoctorListSection extends StatelessWidget {
  final List<DoctorModel> doctors;

  const DoctorListSection({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    if (doctors.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search_off_rounded,
                size: 60,
                color: Colors.grey.shade300,
              ),
              12.ph,
              Text(
                'No doctors found',
                style: AppTextStyles.headline3.copyWith(
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final doctor = doctors[index];
          return DoctorCard(
            doctor: doctor,
            onTap: () {
              context.pushNamed(
                RouteNames.doctorDetail,
                extra: DoctorDetailParams(doctor: doctor),
              );
            },
          );
        }, childCount: doctors.length),
      ),
    );
  }
}
