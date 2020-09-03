import 'package:flutter/material.dart';
import 'package:navegacao/data/dummy_data.dart';
import 'package:navegacao/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //espaco maximo a ocupar
          childAspectRatio: 3 / 2, //proporcao
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES.map(
        (cat) {
          return CategoryItem(
            category: cat,
          );
        },
      ).toList(),
    );
  }
}