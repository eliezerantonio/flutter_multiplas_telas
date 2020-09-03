import 'package:flutter/material.dart';
import 'package:navegacao/models/meal.dart';
import 'package:navegacao/widgets/meail_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(child: Text("Nenhuma refeicao favorita"));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(favoriteMeals[index]);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
