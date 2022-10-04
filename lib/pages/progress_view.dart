import 'dart:async';
import 'package:app_new/pages/home_page_widget.dart';
import 'package:app_new/pages/landing_page.dart';
import 'package:app_new/pages/registermascot.dart';
import 'package:flutter/material.dart';
import 'package:app_new/pages/home_view.dart';
import 'package:app_new/pages/login_view.dart';
import 'package:app_new/pages/recovery_pass.dart';
import 'package:app_new/pages/recovery_password_view.dart';
import 'package:app_new/pages/register.dart';
import 'package:app_new/painter/progress_painter.dart';

class ProgressView extends StatefulWidget {
  const ProgressView(
      //Key? key,
      this.name);
  final name;
  @override
  State<ProgressView> createState() => _ProgressViewState(name);
}

class _ProgressViewState extends State<ProgressView> {
  _ProgressViewState(this.name);
  final name;
  int porcentaje = 0;
  late Timer timer;
  @override
  void initState() {
    porcentajeLoad();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CustomPaint(
          painter: ProgressPainter(porcentaje),
        ),
      ),
    );
  }

  void porcentajeLoad() {
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        if (porcentaje < 100) {
          porcentaje += 2;
        } else {
          timer.cancel();
          Navigator.pop(context);
          if (name == "MailRegister" || name == "IniciarSesionRegistro") {
            Route route =
                MaterialPageRoute(builder: ((context) => const RegisterView()));
            Navigator.push(context, route);
          }
          if (name == "OnBoarding") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeApp(),
              ),
            );
          }
          if (name == "IniciarSesion" || name == "RegistroInicioSesion") {
            Route route =
                MaterialPageRoute(builder: ((context) => const LoginView()));
            Navigator.push(context, route);
          }
          if(name == "IniciarSesionContraseña")
          {
            Route route =
                MaterialPageRoute(builder: ((context) => const RecoveryPassword()));
            Navigator.push(context, route);
          }
          if(name == "recovery")
          {
            Route route =
                MaterialPageRoute(builder: ((context) => const RecoveryPass()));
            Navigator.push(context, route);
          }
          if(name == "landingPage")
          {
            Route route =
                MaterialPageRoute(builder: ((context) => const HomePageWidget()));
            Navigator.push(context, route);
          }
          if(name == "registermascot")
          {
            Route route =
                MaterialPageRoute(builder: ((context) => const RegistermascotWidget()));
            Navigator.push(context, route);
          }
        }
      });
    });
  }
}
