import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/orders.dart';
import '/providers/cart.dart';
import '/Model/order_data.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference cartCollection =
      Firestore.instance.collection('Cart');

  Future updateUserData(
    double amount,
    List products,
  ) async {
    return await cartCollection.document(uid).setData({
      'id': DateTime.now().toString(),
      'amount': amount,
      'products': products,
      'dateTime': DateTime.now(),
    });
  }
}
