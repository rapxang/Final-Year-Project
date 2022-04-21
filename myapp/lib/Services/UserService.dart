import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  Future<void> deleteUser() async {
    QuerySnapshot<Map<String, dynamic>> advertisementsParsable =
        await FirebaseFirestore.instance
            .collection('Advertisement')
            .where('user', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .get();
    for (var e in advertisementsParsable.docs) {
      await FirebaseFirestore.instance
          .collection('Advertisement')
          .doc(e.id)
          .delete();
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .delete();
    return;
  }
}
