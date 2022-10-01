import 'package:flutter/material.dart';
import 'package:app_new/styles/colors/colors_register_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

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
            height: 50,
            child: Row(
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 95,
                      child: Text(
                        'Tienda',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 160,
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
        body: const BodyContent(),
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    width: 90,
                    child: const Text(
                      'Hola',
                      style: TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                    ), 
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 20),
                    width: 90,
                    child: const Text(
                      'Juan',
                      style: TextStyle(fontSize: 39, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ),
                  
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 20, left: 60),
                        width: 90,
                        child: const Text(
                          'Entregar ahora',
                          style: TextStyle(fontSize: 9, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 5, left: 60),
                        width: 90,
                        child: const Text(
                          'Calle 10 9',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
