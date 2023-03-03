import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_dto.dart';
import '../utils/text_strings.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> addUserToDatabase(UserDTO user) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .where('email', isEqualTo: user.email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return thisEmailIsAlredyUsed;
    } else {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: user.email, password: user.password);
      await _firestore.collection('users').add(user.toJson());
    }
  }
}
