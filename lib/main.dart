import 'package:flutter/material.dart';
import 'package:hungroo/data/dummy_data.dart';
import 'package:hungroo/screens/category_meals_screen.dart';
import 'package:hungroo/screens/chefs_book.dart';
import 'package:hungroo/screens/meal_detail_screen.dart';
import 'package:hungroo/screens/profile_screen.dart';
import 'package:hungroo/screens/qr_screen.dart';
import 'package:hungroo/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/favourites_screen.dart';
import 'models/meal.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouritedMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] == true && !(meal.isGlutenFree)) {
          return false;
        }
        if (filters['lactose'] == true && !(meal.isLactoseFree)) {
          return false;
        }
        if (filters['vegan'] == true && !(meal.isVegan)) {
          return false;
        }
        if (filters['vegetarian'] == true && !(meal.isVegetarian)) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFav(String mealId) {
    final existingIndex =
        favouritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouritedMeals
            .removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouritedMeals.add(
          DUMMY_MEALS
              .firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool isMealFavourite(String id) {
    return favouritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hungroo",
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        primarySwatch: Colors.blueGrey,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoLight',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 24,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(favouritedMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFav, isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(filters, setFilters),
        '/favourites': (ctx) => FavouritesScreen(favouritedMeals),
        '/qrcode': (ctx) => QrScreen(),
        '/profile': (ctx) => ProfileScreen(),
        '/chefsbook': (ctx) => ChefsBook(),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.name.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      // jb kuch accha kroge tb kaam aega abhi ke liye nhi h isse jb koi aisi jgh navigate kro jo listed ni h us ke liye h
      // onUnknownRoute: ,
      // tb aaega jb kuch na ho na initail routes na koiroute na hi generate wla tb last option h ye before failing ki freeze ho jae
    );
  }
}
