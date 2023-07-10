import 'package:bus_ticket_reseravtion_app/constant/app_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('buses');

  Future<List<Map<String, dynamic>>> fetchData() async {
    final QuerySnapshot snapshot = await _collectionReference.get();
    final List<Map<String, dynamic>> dataList = snapshot.docs
        .map((DocumentSnapshot document) => document.data() as Map<String, dynamic>)
        .toList();
    logger.i(dataList);
    return dataList;
  }
}