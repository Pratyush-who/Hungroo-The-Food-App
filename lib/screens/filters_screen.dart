import 'package:flutter/material.dart';
import 'package:hungroo/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var lactoseFree = false;
  var vegetarian = false;
  var vegan = false;
  var glutenFree = false;

  @override
  initState() {
    glutenFree = widget.currentFilters['gluten']!;
    lactoseFree = widget.currentFilters['lactose']!;
    vegan = widget.currentFilters['vegan']!;
    vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget switchWalaWidget(
    String title,
    String Descrip,
    bool currValue,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currValue,
      subtitle: Text(Descrip),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': glutenFree,
                  'vegan': vegan,
                  'vegetarian': vegetarian,
                  'lactose': lactoseFree,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Adjust your meal selection.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              switchWalaWidget(
                  'Gluten-Free', 'Only Include Gluten Free Values', glutenFree,
                  (newValue) {
                setState(() {
                  glutenFree = newValue;
                });
              }),
              switchWalaWidget('Vegan', 'Only Include Vegan Values', vegan,
                  (newValue) {
                setState(() {
                  vegan = newValue;
                });
              }),
              switchWalaWidget('Lactose-Free',
                  'Only Include Lactose Free Values', lactoseFree, (newValue) {
                setState(() {
                  lactoseFree = newValue;
                });
              }),
              switchWalaWidget(
                  'Vegetarian', 'Only Include Vegetarian Values', vegetarian,
                  (newValue) {
                setState(() {
                  vegetarian = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
