import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthenticationFacebook{
  static Future<User?> iniciarsesionFacebook(BuildContext context) async {
    FirebaseAuth objAuthenticator = FirebaseAuth.instance;
    User? user;
    
    FacebookLogin objFacebookSignIn = FacebookLogin();
    FacebookLoginResult objFacebookSignInAccount = await objFacebookSignIn.logIn(['email']);

    FacebookAccessToken objAccessToken = objFacebookSignInAccount.accessToken;
    AuthCredential objCredential = FacebookAuthProvider.credential(objAccessToken.token);
    try {
      UserCredential objUserCredential = await objAuthenticator.signInWithCredential(objCredential);
      user = objUserCredential.user;
      return user;
    }on FirebaseAuthException {
      // ignore: avoid_print
      print ("Error en la autenticacion");
    }
    return null;
  }
}