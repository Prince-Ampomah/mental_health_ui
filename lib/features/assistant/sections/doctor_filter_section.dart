import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/assistant/models/doctor_model.dart';

/// SliverPersistentHeaderDelegate that keeps filter chips + result count
/// pinned at the top while the title and search bar scroll away.
class DoctorFilterSection extends SliverPersistentHeaderDelegate {
  final String selectedFilter;
  final int resultCount;
  final ValueChanged<String> onFilterSelected;

  const DoctorFilterSection({
    required this.selectedFilter,
    required this.resultCount,
    required this.onFilterSelected,
  });

  @override
  double get minExtent => maxExtent;

  @override
  double get maxExtent => 88;

  @override
  bool shouldRebuild(DoctorFilterSection old) =>
      old.selectedFilter != selectedFilter || old.resultCount != resultCount;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: const Color(0xFFEAF4F4),
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Horizontally scrollable filter chips
          SizedBox(
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: doctorSpecialtyFilters.length,
              itemBuilder: (context, index) {
                final filter = doctorSpecialtyFilters[index];
                final isSelected = selectedFilter == filter;

                return GestureDetector(
                  onTap: () => onFilterSelected(filter),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF1F5F63)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey.shade700,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          8.ph,

          // Results count
          Text(
            '$resultCount doctors found',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
