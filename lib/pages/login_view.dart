// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app_new/pages/progress_view.dart';
import 'package:app_new/styles/colors/colors_login_view.dart';
import 'package:app_new/styles/colors/colors_register_view.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsRegisterView.backgroundAppBar,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsRegisterView.txtBtnTerminos,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      margin: const EdgeInsets.only(left: 70),
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images_home/splash.png',
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 310,
                  margin: const EdgeInsets.only(top: 43, bottom: 50),
                  child: const Text(
                    'Inicia sesión con tu cuenta para continuar',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorsRegisterView.txtRegister,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const BodyContent(),
              ],
            ),
        ),
      ),
    );
  }
}

class BodyContent extends StatefulWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  State<BodyContent> createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();

  @override
  void dispose() {
    email_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }
  bool value = false;
  int val = -1;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 29, bottom: 5),
          child: const Text(
            'Correo electrónico',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 310,
          height: 70,
          margin: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
            controller: email_controller,
            decoration: InputDecoration(
              labelText: 'Email addres',
              labelStyle: const TextStyle(
                color: ColorsRegisterView.txFName,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: ColorsRegisterView.borderTf,
                  width: 1.5,
                ),
              ),
            ),
            style: const TextStyle(
              fontSize: 16,
              color: ColorsRegisterView.txFName,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 29, bottom: 5),
          child: const Text(
            'Contraseña',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 310,
          height: 70,
          child: TextFormField(
            controller: password_controller,
            obscureText: visible,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: const TextStyle(
                color: ColorsRegisterView.txFName,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: ColorsRegisterView.borderTf,
                  width: 1.5,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: Icon(visible ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            style: const TextStyle(
              fontSize: 16,
              color: ColorsRegisterView.txFName,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: 30, bottom: 120),
          child: InkWell(
            child: const Text(
              '¿Has olvidado la contraseña?',
              style: TextStyle(
                color: ColorsLogin.textPassword,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) =>
                      const ProgressView("IniciarSesionContraseña"));
            },
          ),
        ),
        Container(
          width: 310,
          height: 50,
          margin: const EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            onPressed: () async {
              try {
                final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email_controller.text, password: password_controller.text);
                if (user != null) {
                  showCupertinoModalPopup(context: context, builder: (context)=> const ProgressView("landingPage"));
                }
              } catch (e) {
                print(e);
              }
            },
            style: ElevatedButton.styleFrom(
                primary: ColorsRegisterView.btnNewAccount,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            child: const Text(
              'Ingresar',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Container(
          width: 310,
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿Todavía no tienes cuenta?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              InkWell(
                child: const Text(
                  ' Registrate',
                  style: TextStyle(
                    fontSize: 15,
                    color: ColorsRegisterView.txtBtnTerminos,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) =>
                          const ProgressView("IniciarSesionRegistro"));
                },
              )
            ],
          ),
        ),
      ],
    );
  }
  void _showAlertDialog(res) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: const Text("Mensaje de Inicio de Sesion"),
            content: Text(res),
            actions: <Widget>[
              FlatButton(
                child: const Text(
                  "CERRAR",
                  style: TextStyle(color: Color.fromARGB(255, 3, 116, 177)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  Future<String> fetchPost() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String api = 'desarrollovan-tis.dedyn.io:4010';
    String path = 'Api/User/LogIn';
    final response = await http.post(
      Uri.http(api, path),
      headers: headers,
      body: json.encode({
        "idChannel": 1,
        "email": email_controller.text,
        "password": password_controller.text,
        "idPlatform": 2,
        "idRole": 1,
        "idDevice": ""
      }),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      //return Post.fromJson(json.decode(response.body));
      final map = json.decode(response.body);
      // Create storage
      const storage = FlutterSecureStorage();
      await storage.write(key: 'jqwt', value: map["token"]);
      await storage.write(key: 'idUser', value: map["idUser"]);
      print(map["message"]);
      print(response.body);
      _showAlertDialog(map["message"]);

      String mensaje = "ok";
      return mensaje;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}
