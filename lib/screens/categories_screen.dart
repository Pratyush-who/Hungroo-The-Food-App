import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hungroo/widgets/categroy_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.black, Color.fromARGB(255, 105, 6, 122)],
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
        )),
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES
              .map((catData) =>
                  CategoryItem(catData.title, catData.color, catData.id))
              .toList(),
        ),
    );
  }
}
