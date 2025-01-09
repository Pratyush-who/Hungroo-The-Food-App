import 'package:flutter/material.dart';
import 'package:hungroo/screens/category_meals_screen.dart';
import 'package:hungroo/screens/meal_detail_screen.dart';
import 'package:hungroo/screens/tabs_screen.dart';
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
        '/':(ctx)=>TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
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
