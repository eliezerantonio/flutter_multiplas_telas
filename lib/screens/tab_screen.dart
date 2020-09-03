import 'package:flutter/material.dart';
import 'package:navegacao/models/meal.dart';
import 'package:navegacao/screens/categories_screen.dart';
import 'package:navegacao/screens/favorite_screen.dart';
import 'package:navegacao/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Lista de categorias', 'screen': CategoriesScreen()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals)
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_screens[selectedScreenIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _screens[selectedScreenIndex]['screen'],
        bottomNavigationBar: _bottomNavigationBar());
  }

  BottomNavigationBarItem _bottomNavigationBarItem(Icon icon, String texto) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).primaryColor,
      icon: icon,
      label: texto,
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: _selectScreen,
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).accentColor,
      currentIndex: selectedScreenIndex,
      type: BottomNavigationBarType.shifting,
      items: [
        _bottomNavigationBarItem(Icon(Icons.category), "Categorias"),
        _bottomNavigationBarItem(Icon(Icons.favorite), "Favoritos"),
      ],
    );
  }
}
