import 'package:flutter/cupertino.dart';

import '/providers/cart.dart';

class OrderData {
  final List<CartItem> productData;

  OrderData({this.productData});
}

class Datas with ChangeNotifier {
  final List<OrderData> _data = [];
  List<OrderData> get data {
    return [..._data];
  }

  void addData(List<CartItem> dataCart) {
    _data.insert(0, OrderData(productData: dataCart));
    notifyListeners();
  }
}
