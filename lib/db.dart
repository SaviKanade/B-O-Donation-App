import 'package:cloud_firestore/cloud_firestore.dart';

class Db {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection("donor");
  final CollectionReference seeker =
      FirebaseFirestore.instance.collection("seeker");
  final CollectionReference hospitalbloodbank =
      FirebaseFirestore.instance.collection("hospitalbloodbank");
  Future<void> createDonorData(String name, String email, String address,
      String age, String adhar, String uid) async {
    return await donor.doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
      'address': address,
      'age': age,
      'adhar': adhar,
    });
  }

  Future<void> createSeekerData(
      String name, String address, String contact, String uid) async {
    return await seeker.doc(uid).set({
      'uid': uid,
      'name': name,
      'address': address,
      'contact': contact,
    });
  }

  Future<void> createHospitalBBdata(
      String name, String address, String licenseno, String uid) async {
    return await hospitalbloodbank.doc(uid).set({
      'uid': uid,
      'name': name,
      'address': address,
      'Licence_No': licenseno,
    });
  }
}
