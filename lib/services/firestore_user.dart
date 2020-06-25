import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUserPhoikos {
  final firebaseAuth = FirebaseAuth.instance;

  Future<AuthResult> createAccount(String mail, String mdp) async {
    final AuthResult user = await firebaseAuth.createUserWithEmailAndPassword(
        email: mail, password: mdp);

    String id = user.user.uid;

    Map<String, dynamic> usermap = {
      "mail": mail,
      //ici rajouter les variables quand on a besoin (pseudo etc.)
    };

    Firestore.instance
        .collection("user")
        .document(id)
        .setData(usermap); //update data

    return user;
  }

  Future<AuthResult> connectToAccount(String mail, String mdp) async {
    final AuthResult user = await firebaseAuth.signInWithEmailAndPassword(
        email: mail, password: mdp);

    return user;
  }

  Future<void> forgetPassword(String mail) async {
    await firebaseAuth.sendPasswordResetEmail(email: mail);
  }

  signOut() => firebaseAuth.signOut();
}
