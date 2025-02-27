import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricy, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isLactoseFree;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;

// sbse top pe likha hua import se @required enable hora h
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isLactoseFree,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
