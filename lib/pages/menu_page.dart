import 'package:delivery/controllers/menu_controller.dart';
import 'package:delivery/models/item_model.dart';
import 'package:delivery/widgets/item_widget.dart';
import 'package:delivery/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ItemModel>>(
        future: MenuController().get(),
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingWidget();
            default:
              return Scrollbar(
                isAlwaysShown: true,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: snapshot.data
                      .map(
                        (e) => ItemWidget(model: e),
                      )
                      .toList(),
                ),
              );
          }
        },
      ),
    );
  }
}
