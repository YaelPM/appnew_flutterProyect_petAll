import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_new/pages/home_view.dart';
import 'package:app_new/pages/progress_view.dart';
import 'package:app_new/styles/colors/colors_register_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

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
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                Row(
                  children: const [
                  SizedBox(
                    width: 95,
                    child: Text(
                      'Regístrate',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                      ),
                    ),
                  )
                ],
                ),
                Row(children: [
                  Container(
                    width: 160,
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images_home/splash.png',
                      color: Colors.white,
                    ),
                  )
                ],)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 310,
                  height: 50,
                  margin: const EdgeInsets.only(top: 43, bottom: 12),
                  child: const Text(
                    'Crea una cuenta para empezar a usar la app',
                    textAlign: TextAlign.center,
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

  final name_controller = TextEditingController();
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

   @override
  void dispose() {
    name_controller.dispose();
    email_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  bool value = false;
  int val = -1;
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 29, bottom: 5),
            child: const Text(
              'Nombre',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 310,
            height: 70,
            margin: const EdgeInsets.only(bottom: 12),
            child: TextFormField(
              controller: name_controller,
              validator: (value){
                if(RegExp(r"[A-Za-z]").hasMatch(value!)){
                  return("validado, solo letras");
                }else{
                  return("No valido, hay numeros");
                }
              },
              decoration: InputDecoration(
                labelText: 'Nombre',
                labelStyle: const TextStyle(
                  color: ColorsRegisterView.txFName,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
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
              'Correo electrónico',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 310,
            height: 70,
            margin: const EdgeInsets.only(bottom: 12),
            child: TextFormField(
              controller: email_controller,
              decoration: InputDecoration(
                labelText: 'Dirección de correo',
                labelStyle: const TextStyle(
                  color: ColorsRegisterView.txFName,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
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
                labelText: 'Contraseña',
                labelStyle: const TextStyle(
                  color: ColorsRegisterView.txFName,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
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
            width: 310,
            height: 50,
            margin: const EdgeInsets.only(left: 0),
            child: const Text(
              'La contraseña debe contener caracteres, números y símbolos con un mínimo de 6 caracteres.',
              style: TextStyle(
                color: ColorsRegisterView.txFName,
                fontSize: 12
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 29, bottom: 5),
            child: const Text(
              'Teléfono',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 310,
            height: 70,
            margin: const EdgeInsets.only(bottom: 12),
            child: TextFormField(
              controller: email_controller,
              decoration: InputDecoration(
                labelText: 'Teléfono',
                labelStyle: const TextStyle(
                  color: ColorsRegisterView.txFName,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
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
            margin: const EdgeInsets.only(left: 0),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(right: 0, bottom: 14),
                      child: Checkbox(
                          value: value,
                          side: const BorderSide(
                            color: ColorsRegisterView.borderRadiusCheck,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onChanged: (bool? valueNew) {
                            setState(() {
                              value = valueNew!;
                            });
                          }),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Al registrarme, acepto los',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Route route = MaterialPageRoute(
                                          builder: (context) => const HomeView());
                                      Navigator.push(context, route);
                                    },
                                    child: const Text(
                                      ' términos y',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsRegisterView.txtBtnTerminos,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  InkWell(
                                    child: Text(
                                      'condiciones',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsRegisterView.txtBtnTerminos,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    child: Text(
                                      ' y la',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  InkWell(
                                    child: Text(
                                      ' política de privacidad',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsRegisterView.txtBtnTerminos,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 310,
            height: 50,
            margin: const EdgeInsets.only(top: 26),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              onPressed: () {
                if(_keyForm.currentState!.validate()){
                  print("Validado");
                }else{
                  print("No valido");
                }
                // fetchPost();
              },
              style: ElevatedButton.styleFrom(
                  primary: ColorsRegisterView.btnNewAccount,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: const Text(
                'Crear Cuenta',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            width: 310,
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text(
                  '¿Ya tienes cuenta?',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  child:const Text(
                    ' Iniciar sesión',
                    style: TextStyle(
                      fontSize: 17,
                      color: ColorsRegisterView.txtBtnTerminos,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){
                    showCupertinoModalPopup(context: context, builder: (context)=> const ProgressView("RegistroInicioSesion"));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(res) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: const Text("Mensaje de Creacion de Cuenta"),
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
    String path = 'Api/User/CreateUser';
    final response = await http.post(
      Uri.http(api, path),
      headers: headers,
      body: json.encode({
        "idUser": 0,
        "email": email_controller.text,
        "name": name_controller.text,
        "phoneNumber": "",
        "pass": password_controller.text,
        "idRole": 1,
        "idPlatform": 2,
        "idChannel": 1,
        "guest": "",
        "lasName": ""
      }),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      //return Post.fromJson(json.decode(response.body));

      final map = json.decode(response.body);
      print(map["message"]);
      _showAlertDialog(map["message"]);

      String mensaje = "Si esta bien";
      return mensaje;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}
