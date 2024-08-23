import 'dart:math';

import 'package:flutter/material.dart';

class ArcsLoading extends StatefulWidget {
  const ArcsLoading({super.key});

  @override
  State<ArcsLoading> createState() => _ArcsLoadingState();
}

class _ArcsLoadingState extends State<ArcsLoading>
    with TickerProviderStateMixin {
  late List<Arc> arcs;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    // Initialize arcs with different speeds
    arcs = List.generate(
      5,
      (index) => Arc(
        color: Colors.greenAccent.withOpacity(0.5),
        startAngle: pi / 4,
        sweepAngle: pi / 2,
        speed: 1.0 + index * 0.5,
      ),
    );

    // Initialize animation controller
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {
          for (var arc in arcs) {
            arc.update(controller.value);
          }
        });
      });

    // Repeat the animation
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ArcsPainter(arcs),
      size: const Size(100, 100),
    );
  }
}

class Arc {
  Color color;
  double startAngle;
  double sweepAngle;
  double speed;
  double currentAngle = 0.0;

  Arc({
    required this.color,
    required this.startAngle,
    required this.sweepAngle,
    required this.speed,
  });

  void update(double value) {
    currentAngle = startAngle + value * 2 * pi * speed;
  }
}

class ArcsPainter extends CustomPainter {
  List<Arc> arcs;

  ArcsPainter(this.arcs);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    for (final arc in arcs) {
      final paint = Paint()
        ..color = arc.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2 - 10),
        arc.currentAngle,
        arc.sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
