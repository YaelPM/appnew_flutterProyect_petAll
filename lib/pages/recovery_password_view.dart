import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app_new/pages/progress_view.dart';
import 'package:app_new/styles/colors/colors_recovery_password.dart';
import 'package:app_new/styles/colors/colors_register_view.dart';

class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword({Key? key}) : super(key: key);

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
                      width: 210,
                      child: Text(
                        'Recuperar contraseña',
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
                      margin: const EdgeInsets.only(left: 10),
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
          child: Form(
            child: Column(
              children: [
                Container(
                  width: 310,
                  height: 50,
                  margin: const EdgeInsets.only(top: 43, bottom: 10),
                  child: const Text(
                    'Ingresa tu email para restablecer tu contraseña',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 13,
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
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
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
        SizedBox(
          width: 310,
          height: 70,
          child: TextField(
            controller: _email,
            decoration: InputDecoration(
              labelText: 'Dirección de correo',
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
          width: 290,
          height: 100,
          margin: const EdgeInsets.only(bottom: 150),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 1.5),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Ingrese su correo electrónico registrado y le enviaremos un correo electrónico  que contiene un enlace para reestablecer su contraseña',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorsRecoveryPass.textSpamEmail,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 310,
          height: 50,
          margin: const EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            onPressed: () {
              if (!_email.text.isEmpty) {
                fetchPost();
              }
              showCupertinoModalPopup(context: context, builder: (context)=> const ProgressView("recovery"));
            },
            style: ElevatedButton.styleFrom(
                primary: ColorsRegisterView.btnNewAccount,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            child: const Text(
              'Enviar Solicitud',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
   void _showAlertDialog(code, res) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: const Text("Status de la operacion:"),
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
    String path = 'Api/User/RecoverPassword';
    final response = await http.post(
      Uri.http(api, path),
      headers: headers,
      body: json.encode({"idChannel": 1, "email": _email.text}),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      //return Post.fromJson(json.decode(response.body));

      final map = json.decode(response.body);
      print(map["message"]);
      final storage = new FlutterSecureStorage();
      var value = await storage.read(key: 'jwt');
      print(value);
      _showAlertDialog(map["code"], map["message"]);

      String mensaje = "ok";
      return mensaje;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}
