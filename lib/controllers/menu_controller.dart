import 'package:delivery/models/item_model.dart';

class MenuController {
  List<ItemModel> items = [];

  Future<List<ItemModel>> get() async {
    items.clear();
    await Future.delayed(Duration(seconds: 1));

    for (var i = 1; i < 10; i++) {
      items.add(
        ItemModel(description: 'Item $i', value: 10.0 * i),
      );
    }

    return items;
  }
}
