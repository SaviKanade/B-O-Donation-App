/*import 'package:cloud_firestore/cloud_firestore.dart';

class Db {
  final CollectionReference seeker =
      FirebaseFirestore.instance.collection("seeker");
  Future<void> createUserData(String name, String address, String uid) async {
    return await seeker.doc(uid).set({
      'uid': uid,
      'name': name,
      'address': address,
    });
  }
}*/
