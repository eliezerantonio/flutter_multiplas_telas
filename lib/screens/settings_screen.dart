import 'package:flutter/material.dart';
import 'package:navegacao/models/settings.dart';
import 'package:navegacao/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  //construtor
  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch({
    String title,
    String subttitle,
    bool value,
    Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subttitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuracoes"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Configurações",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  title: 'Sem Glutten',
                  subttitle: 'So exibe refereicoes sem gluten',
                  onChanged: (value) =>
                      setState(() => settings.isGlutenFree = value),
                  value: settings.isGlutenFree,
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subttitle: 'So exibe refeicoes em lactose!',
                  onChanged: (value) =>
                      setState(() => settings.isLactoseFree = value),
                  value: settings.isLactoseFree,
                ),
                _createSwitch(
                  title: 'Vegana',
                  subttitle: 'So exibe refeicoes veganas!',
                  onChanged: (value) =>
                      setState(() => settings.isVegan = value),
                  value: settings.isVegan,
                ),
                _createSwitch(
                  title: 'Vegetariana ',
                  subttitle: 'So exibe refeicoes Vegetarianas!',
                  onChanged: (value) =>
                      setState(() => settings.isVegetarian = value),
                  value: settings.isVegetarian,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
