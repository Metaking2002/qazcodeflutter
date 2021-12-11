import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
class Backend {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  // Check if there is a current user
  Future<User> getCurrentUser() async {
    try {
      final user =  _auth.currentUser;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting user's credentials: exception $e");
      return null;
    }
  }

  Future<QuerySnapshot> getUserMessages({String loggedInUserEmail}) async {
    var userMessages = await _firestore
        .collection('students').document(studentSchoolString).collection('messages')
        .where('sender', isEqualTo: loggedInUserEmail)
        .getDocuments();
    return userMessages;
  }

  Future<QuerySnapshot> getAllMessages() async {
    var messages = await _firestore.collection('students').document(studentSchoolString).collection('messages').getDocuments();
    return messages;
  }

  void addMessage({Map<String, dynamic> messageInstance}) {
    _firestore.collection('students').document(studentSchoolString).collection('messages').add(messageInstance);
  }

  void signOut() {
    _auth.signOut();
  }
}