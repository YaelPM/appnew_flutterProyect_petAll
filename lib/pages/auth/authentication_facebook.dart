import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthenticationFacebook{
  static Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
    }
    // or FacebookAuth.i.accessToken
  }
  static Future<void> checkIfIsLogued() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken != null) {
      final userData = await FacebookAuth.instance.getUserData(fields: "name");
      print(userData.values);
    }else{
      print("no logueado");
    }
  }

  static Future<void> logOut() async {
    await FacebookAuth.instance.logOut();
  }
}