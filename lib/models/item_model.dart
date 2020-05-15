import 'dart:math';

import 'package:flutter/foundation.dart';

class ItemModel {
  final String id = Random().nextDouble().toString();
  String description;
  String details;
  double value;

  ItemModel({
    @required this.description,
    @required this.value,
    this.details =
        'Pizza (Italian: [ˈpittsa], Neapolitan: [ˈpittsə]) is a savory dish of Italian origin, consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients (anchovies, olives, meat, etc.) baked at a high temperature, traditionally in a wood-fired oven. A small pizza is sometimes called a pizzetta.',
  });
}
