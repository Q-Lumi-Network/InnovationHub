import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // Set collection reference
  final CollectionReference teamCollection = FirebaseFirestore.instance.collection('team');

  Future<void> updateUserData(String name, int barcode, String category) async {
    try {
      await teamCollection.doc(uid).set({
        'name': name,
        'barcode': barcode,
        'category': category,
      });
    } catch (e) {
      print('Error updating user data: $e');
    }
  }
}