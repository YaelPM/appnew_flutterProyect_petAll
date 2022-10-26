import 'dart:math';
import 'package:flutter/material.dart';
import 'package:app_new/styles/colors/colors_views.dart';

class ProgressPainter extends CustomPainter {
  ProgressPainter(
    this.porcentajeLoad,
  );
  var porcentajeLoad = 0;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = ColorsSelect.txtBoSubHe
      ..style = PaintingStyle.stroke;


    Offset offset = Offset(size.height * 0.50, size.width * 0.50);
    double radius = size.height / 3;
    canvas.drawCircle(offset, radius, paint);
    final load = Paint()
      ..strokeWidth = 8
      ..color = Colors.amber
      ..style = PaintingStyle.stroke;
    double porcentaje = pi * 2 * (porcentajeLoad / 100.0);
    Rect rect = Rect.fromCircle(center: offset, radius: radius);
    canvas.drawArc(rect, -pi / 2, porcentaje, false, load);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  
  
}


