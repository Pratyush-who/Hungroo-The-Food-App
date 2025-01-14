import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hungroo/screens/filters_screen.dart';
import 'package:hungroo/widgets/categroy_item.dart';
import '../data/dummy_data.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            color: Colors.white,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 7, bottom: 7),
                  child: Text(
                    'Hello, Pratyush!',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Discover Your',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Favourite',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Recepie!',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromARGB(255, 228, 81, 81),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Search for Recepie',
                      hintStyle: const TextStyle(fontSize: 20),
                      prefixIcon: const Icon(
                        Icons.search_sharp,
                        color: Colors.blueGrey,
                        size: 30,
                      ),
                      suffixIcon: const Icon(
                        Icons.mic,
                        color: Colors.blueGrey,
                        size: 30,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none, // Remove border
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(FiltersScreen.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 81, 81),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/images/filters.png', // Replace with your image path
                          height: 28,
                          width: 28,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 25,
                left: 25,
              ),
              child: Row(
                children: [
                  Text(
                    'Top Recepies',
                    style: GoogleFonts.poppins(
                        fontSize: 23, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Image.asset(
                    'assets/images/recepie.png',
                    height: 25,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: DUMMY_CATEGORIES.length,
              itemBuilder: (ctx, index) {
                final catData = DUMMY_CATEGORIES[index];
                return Container(
                  width: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: CategoryItem(
                    catData.title,
                    catData.imageUrl,
                    catData.id,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 25,
              ),
              child: Row(
                children: [
                  Text(
                    'Cook with Top Chefs',
                    style: GoogleFonts.poppins(
                        fontSize: 23, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Image.asset(
                    'assets/images/chef.png',
                    height: 40,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              shrinkWrap: true, // Allows GridView to shrink to fit its content
              physics:
                  const NeverScrollableScrollPhysics(), // Disables GridView's own scrolling
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: DUMMY_CATEGORIES.length,
              itemBuilder: (ctx, index) {
                final catData = DUMMY_CATEGORIES[index];
                return CategoryItem(catData.title, catData.imageUrl, catData.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
