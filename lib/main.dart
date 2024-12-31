import 'package:flutter/material.dart';
import 'package:hungroo/screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hungroo",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoBlackItalic',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      home: const CategoriesScreen(),
      routes: {
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
      },
    );
  }
}
