import 'package:delivery/models/cart_model.dart';
import 'package:delivery/models/item_model.dart';

class CartController {
  List<CartModel> items = [];

  Future<List<CartModel>> get() async {
    items.clear();
    await Future.delayed(Duration(seconds: 1));

    for (var i = 1; i < 5; i++) {
      items.add(
        CartModel(
          item: ItemModel(description: 'Item $i', value: 10.0 * i),
          amount: i,
        ),
      );
    }

    return items;
  }
}
