import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungroo/models/meal.dart';
import 'package:hungroo/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/waiting.png',height: 250,),
          const SizedBox(height: 20),
          Text(
            'You have not starred any recepie yet!',
            style: GoogleFonts.roboto(
              fontSize: 22,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Try adding some..!!',
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          print('Displaying: ${favouriteMeals[index].title}'); // Debugging
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imgUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
