import 'package:flutter/material.dart';
import 'package:hungroo/widgets/meal_item.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
// final String categoryId;
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
      categoryTitle = routeArgs?['title'] ?? 'Default Title';
      final categoryId = routeArgs?['id'] ?? 'Default ID';
      displayedMeals = widget.availableMeals.where((Meal) {
        return Meal.categories.contains(categoryId);
      }).toList();
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeElement(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imgUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
