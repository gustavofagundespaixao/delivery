import 'package:delivery/models/item_model.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter/material.dart';

class ItemDetailsPage extends StatefulWidget {
  final ItemModel model;

  const ItemDetailsPage({Key key, @required this.model}) : super(key: key);

  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.shopping_cart),
        label: Text('Add to cart'),
        onPressed: () => context.pop(null),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            elevation: 0,
            expandedHeight: 200,
            pinned: true,
            floating: true,
            leading: CloseButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Item details'),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  'assets/images/item.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              widget.model.description,
              style: context.textTheme.headline6.apply(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(widget.model.details, style: TextStyle(color: Colors.white)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.remove),
                      ),
                      onTap: () => setState(() => amount--),
                    ),
                  ),
                ),
                SizedBox(width: 1),
                Expanded(
                  child: Material(
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child: Center(
                        child: Text(
                          '$amount',
                          style: context.textTheme.headline6.apply(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 1),
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.add),
                      ),
                      onTap: () => setState(() => amount++),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
