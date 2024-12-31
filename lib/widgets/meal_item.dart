import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key});
  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
