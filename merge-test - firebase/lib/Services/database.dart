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
    var products,
  ) async {
    return await cartCollection.document(uid).setData({
      'id': DateTime.now().toString(),
      'amount': amount,
      'products': products,
      'dateTime': DateTime.now(),
    });
  }

  Future updateUserCart(
    String id,
    String title,
    double total,
    int quantity,
  ) async {
    // DocumentReference docRef = cartCollection.document(uid);
    // DocumentSnapshot docSnap = await docRef.get();
    // Map<String, dynamic> docData = docSnap.data;
    // List<Map<String, dynamic>> products = (docData['products'] as List<dynamic>)
    //     .map((products) => Map<String, dynamic>.from(products))
    //     .toList();
    List<Map<String, dynamic>> products = [
      {
        'id': 1,
        'title': title,
        'total': total,
        'quantity': quantity,
      },
      {
        'id': 2,
        'title': title,
        'total': total,
        'quantity': quantity,
      },
    ];

    return await cartCollection
        .document(uid)
        .updateData({'products': products.toList()});
  }
}
