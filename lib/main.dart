import 'package:flutter/material.dart';
import 'package:hungroo/category_meals_screen.dart';
import './categories_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hungroo",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoBlackItalic',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      home: CategoriesScreen(),
      routes: {'/category-meals': (ctx) => CategoryMealsScreen()},
    );
  }
}
