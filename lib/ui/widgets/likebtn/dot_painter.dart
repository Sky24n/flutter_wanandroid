import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_wanandroid/ui/widgets/likebtn/like_button_util.dart';

class DotPainter extends CustomPainter {
  final int dotCount;
  double outerDotsPositionAngle = 51.42;

  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;

  double centerX = 0.0;
  double centerY = 0.0;

  final List<Paint> circlePaints = List(4);

  double maxOuterDotsRadius = 0.0;
  double maxInnerDotsRadius = 0.0;
  double maxDotSize;

  final currentProgress;

  double currentRadius1 = 0.0;
  double currentDotSize1 = 0.0;
  double currentDotSize2 = 0.0;
  double currentRadius2 = 0.0;

  bool isFirst = true;

  DotPainter({
    @required this.currentProgress,
    this.dotCount = 7,
    this.color1 = const Color(0xFFFFC107),
    this.color2 = const Color(0xFFFF9800),
    this.color3 = const Color(0xFFFF5722),
    this.color4 = const Color(0xFFF44336),
  }) {
    outerDotsPositionAngle = 360.0 / dotCount;
    for (int i = 0; i < circlePaints.length; i++) {
      circlePaints[i] = new Paint()..style = PaintingStyle.fill;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (isFirst) {
      centerX = size.width * 0.5;
      centerY = size.height * 0.5;
      maxDotSize = size.width * 0.05;
      maxOuterDotsRadius = size.width * 0.5 - maxDotSize * 2;
      maxInnerDotsRadius = 0.8 * maxOuterDotsRadius;
      isFirst = false;
    }
    _updateOuterDotsPosition();
    _updateInnerDotsPosition();
    _updateDotsPaints();
    _drawOuterDotsFrame(canvas);
    _drawInnerDotsFrame(canvas);
  }

  void _drawOuterDotsFrame(Canvas canvas) {
    for (int i = 0; i < dotCount; i++) {
      double cX = centerX +
          currentRadius1 * math.cos(i * degToRad(outerDotsPositionAngle));
      double cY = centerY +
          currentRadius1 * math.sin(i * degToRad(outerDotsPositionAngle));
      canvas.drawCircle(Offset(cX, cY), currentDotSize1,
          circlePaints[i % circlePaints.length]);
    }
  }

  void _drawInnerDotsFrame(Canvas canvas) {
    for (int i = 0; i < dotCount; i++) {
      double cX = centerX +
          currentRadius2 *
              math.cos((i * degToRad(outerDotsPositionAngle - 10)));
      double cY = centerY +
          currentRadius2 *
              math.sin((i * degToRad(outerDotsPositionAngle - 10)));
      canvas.drawCircle(Offset(cX, cY), currentDotSize2,
          circlePaints[(i + 1) % circlePaints.length]);
    }
  }

  void _updateOuterDotsPosition() {
    if (currentProgress < 0.3) {
      currentRadius1 = mapValueFromRangeToRange(
          currentProgress, 0.0, 0.3, 0.0, maxOuterDotsRadius * 0.8);
    } else {
      currentRadius1 = mapValueFromRangeToRange(currentProgress, 0.3, 1.0,
          0.8 * maxOuterDotsRadius, maxOuterDotsRadius);
    }
    if (currentProgress == 0) {
      currentDotSize1 = 0;
    } else if (currentProgress < 0.7) {
      currentDotSize1 = maxDotSize;
    } else {
      currentDotSize1 =
          mapValueFromRangeToRange(currentProgress, 0.7, 1.0, maxDotSize, 0.0);
    }
  }

  void _updateInnerDotsPosition() {
    if (currentProgress < 0.3) {
      currentRadius2 = mapValueFromRangeToRange(
          currentProgress, 0.0, 0.3, 0.0, maxInnerDotsRadius);
    } else {
      currentRadius2 = maxInnerDotsRadius;
    }
    if (currentProgress == 0) {
      currentDotSize2 = 0;
    } else if (currentProgress < 0.2) {
      currentDotSize2 = maxDotSize;
    } else if (currentProgress < 0.5) {
      currentDotSize2 = mapValueFromRangeToRange(
          currentProgress, 0.2, 0.5, maxDotSize, 0.3 * maxDotSize);
    } else {
      currentDotSize2 = mapValueFromRangeToRange(
          currentProgress, 0.5, 1.0, maxDotSize * 0.3, 0.0);
    }
  }

  void _updateDotsPaints() {
    double progress = clamp(currentProgress, 0.6, 1.0);
    int alpha =
        mapValueFromRangeToRange(progress, 0.6, 1.0, 255.0, 0.0).toInt();
    if (currentProgress < 0.5) {
      double progress =
          mapValueFromRangeToRange(currentProgress, 0.0, 0.5, 0.0, 1.0);
      circlePaints[0]
        ..color = Color.lerp(color1, color2, progress).withAlpha(alpha);
      circlePaints[1]
        ..color = Color.lerp(color2, color3, progress).withAlpha(alpha);
      circlePaints[2]
        ..color = Color.lerp(color3, color4, progress).withAlpha(alpha);
      circlePaints[3]
        ..color = Color.lerp(color4, color1, progress).withAlpha(alpha);
    } else {
      double progress =
          mapValueFromRangeToRange(currentProgress, 0.5, 1.0, 0.0, 1.0);
      circlePaints[0]
        ..color = Color.lerp(color2, color3, progress).withAlpha(alpha);
      circlePaints[1]
        ..color = Color.lerp(color3, color4, progress).withAlpha(alpha);
      circlePaints[2]
        ..color = Color.lerp(color4, color1, progress).withAlpha(alpha);
      circlePaints[3]
        ..color = Color.lerp(color1, color2, progress).withAlpha(alpha);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
