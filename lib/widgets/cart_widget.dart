import 'package:delivery/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';

class CartWidget extends StatelessWidget {
  final CartModel model;

  const CartWidget({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/item.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                model.item.description,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                '${model.amount} x ${model.item.value.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white54),
              ),
              trailing: Text(
                '\$ ${(model.item.value * model.amount).toStringAsFixed(2)}',
                style: context.textTheme.headline6.apply(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
