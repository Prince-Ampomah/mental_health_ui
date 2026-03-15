import 'package:flutter/material.dart';
import 'package:mental_health_ui/features/assistant/models/doctor_model.dart';
import 'package:mental_health_ui/features/assistant/sections/doctor_search_section.dart';
import 'package:mental_health_ui/features/assistant/sections/doctor_filter_section.dart';
import 'package:mental_health_ui/features/assistant/sections/doctor_list_section.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  String _selectedFilter = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isCollapsed = false;

  List<DoctorModel> get _filteredDoctors {
    return doctors.where((doc) {
      final matchesFilter =
          _selectedFilter == 'All' || doc.specialty == _selectedFilter;
      final matchesSearch =
          _searchQuery.isEmpty ||
          doc.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          doc.specialty.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final collapsed = _scrollController.offset > 160;
      if (collapsed != _isCollapsed) {
        setState(() => _isCollapsed = collapsed);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _revealSearch() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFEAF4F4),
      child: Stack(
        children: [
          // ── SCROLLABLE CONTENT ──
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Collapsible: title + bell + search
              SliverToBoxAdapter(
                child: DoctorSearchSection(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val),
                  onClear: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  },
                  hasQuery: _searchQuery.isNotEmpty,
                ),
              ),

              // Pinned: filter chips + result count
              SliverPersistentHeader(
                pinned: true,
                delegate: DoctorFilterSection(
                  selectedFilter: _selectedFilter,
                  resultCount: _filteredDoctors.length,
                  onFilterSelected: (f) => setState(() => _selectedFilter = f),
                ),
              ),

              // Doctor cards or empty state
              DoctorListSection(doctors: _filteredDoctors),
            ],
          ),

          // ── OVERLAY SEARCH BUTTON ──
          // Visible only when header has scrolled out of view
          Positioned(
            bottom: 16,
            right: 20,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              offset: _isCollapsed ? Offset.zero : const Offset(0, 2.5),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isCollapsed ? 1.0 : 0.0,
                child: IgnorePointer(
                  ignoring: !_isCollapsed,
                  child: GestureDetector(
                    onTap: _revealSearch,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F5F63),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1F5F63).withAlpha(80),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
