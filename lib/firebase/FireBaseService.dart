import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference petsCollection =
      FirebaseFirestore.instance.collection('pets');

  Future<void> addPet(String name, String remedyDate, String examDate) async {
    await petsCollection.add({
      'name': name,
      'remedyDate': remedyDate,
      'examDate': examDate,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getPetsStream() {
    return petsCollection.orderBy('createdAt', descending: true).snapshots();
  }

  Future<void> deletePet(String id) async {
    await petsCollection.doc(id).delete();
  }
}
