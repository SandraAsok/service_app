import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future googleSignIn() async {
  final googleSignIn = GoogleSignIn();
  // ignore: body_might_complete_normally_catch_error
  final googleUser = await googleSignIn.signIn().catchError((onError) {});
  if (googleUser == null) {
    return;
  }
  final googleAuth = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  await FirebaseAuth.instance.signInWithCredential(credential);
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.setString('email', GoogleAuthProvider.PROVIDER_ID);
}
