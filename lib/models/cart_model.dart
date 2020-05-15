import 'package:delivery/models/item_model.dart';
import 'package:flutter/foundation.dart';

class CartModel {
  final ItemModel item;
  final int amount;

  CartModel({@required this.item, @required this.amount});
}
