import 'package:flutter/material.dart';

class CustomBackground extends CustomPainter {
  double perc = 0.4, rad = 40;
  final BuildContext context;

  CustomBackground({@required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint(), paint2 = Paint();
    paint2.color = Colors.purple[200];
    paint.style = PaintingStyle.fill;
    paint2.style = PaintingStyle.fill;
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint2);

    paint.color = Colors.deepPurple.withOpacity(0.7);
    if (Theme.of(context).brightness == Brightness.dark) {
      paint2.color = Colors.black.withOpacity(0.4);
      path.reset();
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      canvas.drawPath(path, paint2);
      paint.color = Colors.deepPurple;
    }

    paint.shader = LinearGradient(
      stops: [0.5, 1],
      colors: [Colors.purple, Colors.deepPurple],
    ).createShader(Rect.fromLTWH(
      0,
      0,
      size.width * 0.6,
      size.height,
    ));
    path.reset();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(2.9 * size.width / 4, size.height);
    path.quadraticBezierTo(
      size.width * (perc * 2),
      7 * size.height / 9,
      size.width / 1.4,
      size.height / 1.5,
    );
    path.quadraticBezierTo(
      size.width * (perc / 1.1),
      2 * size.height / 9,
      size.width / 1.3,
      0,
    );

    path.close();
    canvas.drawPath(path, paint);
    if (Theme.of(context).brightness == Brightness.dark) {
      paint.color = Colors.black.withOpacity(0.6);

      paint.shader = null;
    } else
      paint.shader = LinearGradient(colors: [
        Colors.pink[200].withOpacity(0.7),
        Colors.purple.withOpacity(0.7)
      ]).createShader(Rect.fromLTWH(
        0,
        size.width * 0.6,
        size.width,
        size.height,
      ));

    path.reset();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.6 * size.width, size.height);
    path.quadraticBezierTo(
      size.width * (perc * 1.1),
      0.8 * size.height,
      size.width / 1.8,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * (perc * 2.3),
      0.2 * size.height,
      size.width / 1.3,
      0,
    );

    path.close();
    canvas.drawPath(path, paint);
    if (Theme.of(context).brightness == Brightness.dark) {
      paint.shader = null;
      paint.color = Colors.black.withOpacity(0.7);
    } else {
      paint.color = Colors.pink[100].withOpacity(0.5);
      paint.shader = LinearGradient(colors: [
        Colors.pink[400].withOpacity(0.6),
        Colors.pink[100].withOpacity(0.5)
      ]).createShader(Rect.fromLTWH(
        0,
        0,
        size.width * 0.4,
        size.height,
      ));
    }
    path.reset();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.quadraticBezierTo(
      size.width * (perc * 0.6),
      0.75 * size.height,
      size.width / 2.5,
      size.height / 2,
    );
    path.quadraticBezierTo(
      size.width * (perc * 1.2),
      0.25 * size.height,
      size.width * 0.3,
      0,
    );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
