import 'package:delivery/controllers/cart_controller.dart';
import 'package:delivery/models/cart_model.dart';
import 'package:delivery/widgets/cart_widget.dart';
import 'package:delivery/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        icon: Icon(Icons.check),
        label: Text('Done'),
        onPressed: () {},
      ),
      body: FutureBuilder<List<CartModel>>(
        future: CartController().get(),
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingWidget();
            default:
              var totalValue = 0.0;

              for (var model in snapshot.data) {
                totalValue += model.amount * model.item.value;
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(16),
                        type: MaterialType.card,
                        child: Column(
                          children: snapshot.data
                              .map((e) => CartWidget(model: e))
                              .toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(16),
                        type: MaterialType.card,
                        child: ListTile(
                          title: Text(
                            'Total',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            '\$ ${totalValue.toStringAsFixed(2)}',
                            style: context.textTheme.headline6.apply(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
