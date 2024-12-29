import 'package:flutter/material.dart';
import 'package:hungroo/models/meal.dart';
import 'dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
// final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
final routeArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
final categoryTitle = routeArgs?['title'] ?? 'Default Title';
final categoryId = routeArgs?['id'] ?? 'Default ID';
    final categoryMeals = DUMMY_MEALS.where((Meal) {
      return Meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoBlack',
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
