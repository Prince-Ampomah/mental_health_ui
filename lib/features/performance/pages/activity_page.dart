import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/text_style_theme.dart';
import 'package:mental_health_ui/core/utils/extension.dart';
import 'package:mental_health_ui/features/performance/models/performance_model.dart';
import 'dart:math' as math;

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Your result" heading
          Center(
            child: Text(
              'Your result',
              style: AppTextStyles.headline3.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          16.ph,

          // Monthly Mood Summary teal card
          _MoodSummaryCard(),

          16.ph,

          // Trending activity card
          _TrendingResultCard(activity: trendingResult),
        ],
      ),
    );
  }
}

// ── Teal "Good" mood card ──
class _MoodSummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF3E9EA3), Color(0xFF5BB8BD)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Monthly Mood Summary',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                8.ph,
                const Text(
                  'Good',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
                12.ph,
                Text(
                  'You are seeing the average percentage\nof your mood during the month.',
                  style: TextStyle(
                    color: Colors.white.withAlpha(200),
                    fontSize: 11,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          16.pw,

          // Smiley face illustration
          _SmileyIllustration(),
        ],
      ),
    );
  }
}

// ── Custom drawn smiley face (no image needed) ──
class _SmileyIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(70, 80), painter: _SmileyPainter());
  }
}

class _SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withAlpha(40)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = Colors.white.withAlpha(180)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    // Outer glow circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.46,
      paint,
    );

    // Face circle
    paint.color = Colors.white.withAlpha(60);
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.38,
      paint,
    );

    final cx = size.width / 2;
    final cy = size.height / 2;

    // Eyes
    strokePaint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx - 9, cy - 6), 3, strokePaint);
    canvas.drawCircle(Offset(cx + 9, cy - 6), 3, strokePaint);

    // Smile
    strokePaint.style = PaintingStyle.stroke;
    final smilePath = Path();
    smilePath.moveTo(cx - 10, cy + 4);
    smilePath.quadraticBezierTo(cx, cy + 14, cx + 10, cy + 4);
    canvas.drawPath(smilePath, strokePaint);

    // Small decorative dots around face
    paint.color = Colors.white.withAlpha(80);
    canvas.drawCircle(Offset(cx - 22, cy - 16), 2.5, paint);
    canvas.drawCircle(Offset(cx + 22, cy + 10), 2, paint);
    canvas.drawCircle(Offset(cx + 18, cy - 20), 1.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Trending activity card with sparkline ──
class _TrendingResultCard extends StatelessWidget {
  final TrendingResultModel activity;

  const _TrendingResultCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Activity icon box
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: activity.iconBgColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(activity.icon, size: 26, color: Colors.black54),
          ),

          14.pw,

          // Title + duration
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: AppTextStyles.headline3.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                6.ph,
                Row(
                  children: [
                    Icon(Icons.schedule, size: 13, color: Colors.grey.shade500),
                    4.pw,
                    Text(
                      activity.duration,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Last week label
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    'Last week',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                  ),
                  4.pw,
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
              12.ph,
              // Mini sparkline chart
              SizedBox(
                width: 60,
                height: 28,
                child: CustomPaint(
                  painter: _SparklinePainter(
                    data: activity.sparklineData,
                    color: const Color(0xFF1F5F63),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Sparkline painter ──
class _SparklinePainter extends CustomPainter {
  final List<double> data;
  final Color color;

  const _SparklinePainter({required this.data, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    final stepX = size.width / (data.length - 1);

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final y = size.height - (data[i] * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        // Smooth curve between points
        final prevX = (i - 1) * stepX;
        final prevY = size.height - (data[i - 1] * size.height);
        final controlX = (prevX + x) / 2;
        path.cubicTo(controlX, prevY, controlX, y, x, y);
      }
    }

    canvas.drawPath(path, paint);

    // Draw dot at last point
    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final lastX = (data.length - 1) * stepX;
    final lastY = size.height - (data.last * size.height);
    canvas.drawCircle(Offset(lastX, lastY), 3, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter old) =>
      old.data != data || old.color != color;
}
