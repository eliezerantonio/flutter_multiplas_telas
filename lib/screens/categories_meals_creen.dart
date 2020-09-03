import 'package:flutter/material.dart';
import 'package:navegacao/data/dummy_data.dart';
import 'package:navegacao/models/category.dart';
import 'package:navegacao/models/meal.dart';
import 'package:navegacao/widgets/meail_item.dart';

class CategoriesMealsScreen extends StatelessWidget {

  final List<Meal> meals;
  const CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    //recebendo dados
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id); //pertence na lista
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
