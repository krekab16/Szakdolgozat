import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_dto.dart';
import '../utils/text_strings.dart';

class UserDatabaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserToDatabase(UserDTO userDTO) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: userDTO.email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        throw Exception(emailAlreadyUsedErrorMessage);
      } else {
        UserCredential userCredential =
            await _firebaseAuth.createUserWithEmailAndPassword(
                email: userDTO.email, password: userDTO.password);
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userDTO.toJson());
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
