import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';
import '../utils/text_strings.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registerUser(UserModel user) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        throw FirebaseAuthException(
          code: emailAlredyInUse,
          message: thisEmailIsAlredyUsed,
        );
      } else {
        UserCredential userCredential =
            await _firebaseAuth.createUserWithEmailAndPassword(
                email: user.email, password: user.password);
        await _firestore.collection('users').doc(userCredential.user?.uid).set({
          'name': user.name,
          'userName': user.userName,
          'email': user.email,
          'organizer': user.organizer,
        });
      }
    } on FirebaseAuthException catch (e) {
      return 'This email is already registered. Please try logging in or use a different email address.';
    }
  }

  Future<void> logInWithEmailAndPassword(UserModel user) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
