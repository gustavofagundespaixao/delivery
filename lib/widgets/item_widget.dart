import 'package:delivery/models/item_model.dart';
import 'package:build_context/build_context.dart';
import 'package:delivery/pages/item_details_page.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel model;

  const ItemWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        child: GestureDetector(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/images/item.jpg', fit: BoxFit.cover),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Material(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '\$ ${model.value.toStringAsFixed(2)}',
                      style: context.textTheme.headline6
                          .apply(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Material(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.description,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            showDialog(
              context: context,
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ItemDetailsPage(model: model),
              ),
            );
          },
        ),
      ),
    );
  }
}
