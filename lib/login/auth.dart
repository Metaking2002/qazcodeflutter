import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
User curentUser;
bool isSignedIn;
int FirstTimeOrNot = 0;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
abstract class BaseAuth {

  Future<String> currentUser();
  Future<String> signIn(String email, String password);
  Future<void> signOut();
}

class Auth implements BaseAuth {


  Future<String> signIn(String email, String password) async {
    final user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    curentUser = user.user;
    return user.user.uid;
  }



  Future<String> currentUser() async {
    final user =  firebaseAuth.currentUser;
    curentUser =  firebaseAuth.currentUser;
    return user != null ? user.uid : null;
  }

  Future<void> signOut() async {
    return firebaseAuth.signOut();
  }

}