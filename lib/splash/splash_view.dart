import 'package:flutter/material.dart';
import 'package:app_new/styles/colors/colors_views.dart';

// Importaciones clase Vistas
import '../pages/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _toOnbording();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: _SplashCanvas(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Image.asset(
                    "assets/images_home/splash.png",
                    alignment: Alignment.center,
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _toOnbording(){
    Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>const OnBoarding(),
      ),
    );
  }
}

class _SplashCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = ColorsSelect.btnBackgroundBo2;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    path.lineTo(0, size.height * 0.10);

    path.quadraticBezierTo(size.width * 0.1, size.height * 0.20, size.width / 3,
        size.height * 0.12);

    path.quadraticBezierTo(size.width / 2.1, size.height * 0.08,
        2 * (size.width / 3), size.height * 0.12);

    path.quadraticBezierTo(size.width / 1.2, size.height * 0.15,
        3 * (size.width / 3), size.height * 0.1);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);

    final paint2 = Paint();

    paint2.color = ColorsSelect.btnBackgroundBo2;

    paint2.style = PaintingStyle.fill;

    paint2.strokeWidth = 5;

    final path2 = Path();

    path2.lineTo(0, size.height);
    path2.quadraticBezierTo(
        size.width * 0.70, size.height * 0.80, size.width, size.height);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);

    canvas.drawPath(path2, paint2);

    canvas.scale(0.30, 0.30);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
