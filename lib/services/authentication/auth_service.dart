import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier{
  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instance of firestore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // Sign user in
  Future<UserCredential> signInWithEmailandPassword(String email, String password) async {
    try{
      // Sign in
      UserCredential userCredential =
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      // add any new document for the users in users collection if it doesnt already exists
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid' : userCredential.user!.uid,
        'email' : email,
      }, SetOptions(merge:true));

      return userCredential;
    }
    // Catch any errors
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  // create a new user
  Future<UserCredential> signUpWithEmailAndPassword(String email, password) async {
    try{
      UserCredential userCredential = await _firebaseAuth.
      createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      //After create new user,
      // create a new document for the user in the users collection
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid' : userCredential.user!.uid,
        'email' : email,
      });
      return userCredential;

    }
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign user out
  Future<void> signOut() async{
    return await FirebaseAuth.instance.signOut();
  }
}