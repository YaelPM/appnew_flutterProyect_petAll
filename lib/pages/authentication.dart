import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication{
  static Future<User?> iniciarSesion(BuildContext context) async{
    FirebaseAuth authenticator = FirebaseAuth.instance;
    User? user;
    GoogleSignIn objGoogleSingIn = GoogleSignIn();
    GoogleSignInAccount? objGoogleSingInAccount = await objGoogleSingIn.signIn();

    if (objGoogleSingInAccount != null){
    GoogleSignInAuthentication objGoogleSingInAutentication = await objGoogleSingInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: objGoogleSingInAutentication.accessToken,
      idToken: objGoogleSingInAutentication.idToken
    );
    try{
      UserCredential userCredential= await authenticator.signInWithCredential(credential);
      user = userCredential.user;
      return user;
    } on FirebaseAuthException{
      // ignore: avoid_print
      print("error en la autenticacion");
    }
  }
    return null;
  }
}
 