import 'package:flutter/material.dart';
import 'package:app_new/styles/colors/colors_register_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class RecoveryPass extends StatelessWidget {
  const RecoveryPass({Key? key}) : super(key: key);

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
                  margin: const EdgeInsets.only(top: 43, bottom: 50),
                  child: const Text(
                    'Por tu seguridad, tu contraseña debe tener una longitud de entre 8 y 15 caracteres, usar mayúsculas, minúsculas, contener por lo menos un número y un carácter especial',
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
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  @override
  void dispose(){
    _password.dispose();
    _confirm.dispose();
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
            'Nueva contraseña',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 310,
          height: 70,
          child: TextField(
            controller: _password,
            decoration: InputDecoration(
              labelText: 'Nueva contraseña',
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
          margin: const EdgeInsets.only(left: 29, bottom: 5, top: 20),
          child: const Text(
            'Confirmar nueva contraseña',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 310,
          height: 70,
          child: TextField(
            controller: _confirm,
            decoration: InputDecoration(
              labelText: 'Confirmar nueva contraseña',
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
          width: 310,
          height: 50,
          margin: const EdgeInsets.only(top: 185),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            onPressed: () {
              if(_password.text.isNotEmpty && _password.text == _confirm.text){
                fetchPost();
              }else{
                print("las entradas no coinciden o estan vacias");
              }
            },
            style: ElevatedButton.styleFrom(
                primary: ColorsRegisterView.btnNewAccount,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            child: const Text(
              'Actualizar contraseña',
              style: TextStyle(fontSize: 18),
            ),
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
    final storage = new FlutterSecureStorage();
    var value = await storage.read(key: 'jwt');
    var iduser = await storage.read(key: 'idUser');
    
    Map<String, String> headers = {'Content-Type': 'application/json','Authorization': 'Bearer $value'};
    String api = 'desarrollovan-tis.dedyn.io:4010';
    String path = 'Api/User/UpdatePassword';
    final response = await http.post(
      Uri.http(api, path),
      headers: headers,
      body: json.encode({"idUser": iduser, "password": _password.text}),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      //return Post.fromJson(json.decode(response.body));

      final map = json.decode(response.body);
      print(map["message"]);
      _showAlertDialog(map["message"]);

      String mensaje = "ok";
      return mensaje;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}