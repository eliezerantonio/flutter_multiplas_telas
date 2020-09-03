import 'package:flutter/material.dart';
import 'package:navegacao/data/dummy_data.dart';
import 'package:navegacao/helpers/app_routes.dart';
import 'package:navegacao/models/settings.dart';
import 'package:navegacao/screens/categories_meals_creen.dart';
import 'package:navegacao/screens/categories_screen.dart';
import 'package:navegacao/screens/mail_detail_screen.dart';
import 'package:navegacao/screens/settings_screen.dart';
import 'package:navegacao/screens/tab_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avalableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  //sempre que ouver mudancas nas configuracoes

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avalableMeals = DUMMY_MEALS.where((meal) {
        //se  a comida nao e* glutten e o usuario pediu,para mostrar apenas glutten
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarain = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarain;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: AppRoutes.HOME,

      routes: {
        AppRoutes.HOME: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(_avalableMeals),
        AppRoutes.MEAL_DETAIL: (context) => MeailDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (context) => SettingsScreen(_filterMeals, settings)
      },
      //gerar rotas dinamicas
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/alguma-coisa') {
      //     return null;
      //   } else if (settings.name == '/outra-coisa') {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(
      //       builder: (_) {
      //         return CategoriesScreen();
      //       },
      //     );
      //   }
      // },
      //caso tenha rota desconhecida
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //       builder: (_) {
      //         return CategoriesScreen();
      //       },
      //     );
      // },
    );
  }
}
