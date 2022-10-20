import 'package:app_new/pages/auth/authentication.dart';
import 'package:app_new/pages/auth/authentication_facebook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_new/pages/progress_view.dart';
import 'package:app_new/styles/colors/colors_home_page.dart';

void main() {
  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //   theme: ThemeData(
    //   primaryColor: Colors.amber
  
    // ),
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        
        backgroundColor: ColorHomePage.backgroundHome,
        body: Column(
          children: [
            Center(
              child: Container(
                height: 160,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Image.asset(
                  'assets/images_home/splash.png',
                  width: 300,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 48,
              margin: const EdgeInsets.only(bottom: 20, top: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  User? user = await Authentication.iniciarSesion(context);
                  // ignore: avoid_print
                  print(user?.displayName);
                  showCupertinoModalPopup(context: context, builder: (context)=> const ProgressView("landingPage"));
                },
                style:  ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ) ,
                  primary: ColorHomePage.btnGoogleSing,
                ), 
                child: Row(
                  children:  [
                    Image.asset(
                      'assets/images_home/google.png',
                      width: 30,
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: const Text(
                        'Continuar con Google',
                        style: TextStyle(
                        color: ColorHomePage.textColorBtn,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              height: 48,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: ElevatedButton(
                onPressed: () async{
                  AuthenticationFacebook.signInWithFacebook();
                },
                style:  ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ) ,
                  primary: ColorHomePage.btnFacebook,
                ), 
                child: Row(
                  children:  [
                    Image.asset(
                      'assets/images_home/facebook.png',
                      width: 30,
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 23, right: 27.5),
                      child: const Text(
                        'Continuar con Facebook',
                        style: TextStyle(
                        color: ColorHomePage.textColorBtn,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                border: Border.all(
                  color: ColorHomePage.outlineBtnRegister,
                  width: 3,
                ),
              ),
              child: 
                ElevatedButton( 
                  onPressed: (){
                    showCupertinoModalPopup(context: context, builder: (context)=> const ProgressView("MailRegister"));
                },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ) ,
                primary: ColorHomePage.backgroundBtnMail,
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 31),
                    child: const Icon(
                      Icons.mail,
                      color: ColorHomePage.iconMail,
                      size: 30,
                    ),
                  ),
                  const Text(
                    'Registrarse con e-mail',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorHomePage.txtColorMail,
                    ),
                  )
                ],
              ),
              ),
            ),
            Container(
              width: 300,
              height: 48,
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 20,bottom: 9),
              color: ColorHomePage.backgroundHome,
              child: const Text(
                'Entrar como invitado ',
                style: TextStyle(
                  color: ColorHomePage.textBtnInvited,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 48,
              alignment: Alignment.topCenter,
              color: ColorHomePage.backgroundHome,
              child: const Text(
                'Entrar como vendedor ',
                style: TextStyle(
                  color: ColorHomePage.txtBtnSelling,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 48,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                   const Padding(
                     padding: EdgeInsets.only(right: 2.5),
                     child: Text(
                      '¿Ya tienes una cuenta?',
                      style: TextStyle(
                        color: ColorHomePage.txtBtnAccount,
                        fontSize: 13,
                      ),
                  ),
                   ),
                  InkWell(
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        color: ColorHomePage.textBtnInvited,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap:(){
                      showCupertinoModalPopup(context: context, builder: (context)=> const ProgressView("IniciarSesion"));
                    } ,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
