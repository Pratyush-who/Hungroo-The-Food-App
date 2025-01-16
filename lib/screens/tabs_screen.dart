import 'package:flutter/material.dart';
import 'package:hungroo/screens/categories_screen.dart';
import 'package:hungroo/screens/chefs_book.dart';
import 'package:hungroo/screens/favourites_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungroo/screens/profile_screen.dart';
import 'package:hungroo/screens/qr_screen.dart';
import 'package:hungroo/widgets/bottom_navi_bar.dart';
import 'package:hungroo/widgets/main_drawer.dart';
import 'package:hungroo/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals; // List of favourite meals passed to the screen

  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> pages; // List of pages for the tabs
  int selectedPageIndex = 0; // Index of the currently selected page

  @override
  void initState() {
    super.initState();
    pages = [
      CategoriesScreen(), // Categories screen
      FavouritesScreen(widget.favouriteMeals),
      QrScreen(), 
      ChefsBook(),
      ProfileScreen(),
    ];
  }

  void _onPageSelected(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background to white
        elevation: 0, // Remove AppBar shadow
        scrolledUnderElevation: 0, // Remove additional shadow when scrolled
        title: Row(
          children: [
            const Text(
              ' ', // Placeholder for spacing
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 210, // Add space before the next widget
            ),
            Image.asset(
              'assets/images/crown.png', // Display crown image
              height: 30,
            ),
            SizedBox(
              width: 20, // Add space between the image and the icon
            ),
            Icon(Icons.notifications_active_outlined), // Notification icon
          ],
        ),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              margin: const EdgeInsets.only(left: 16.0, top: 10.0),
              child: Image.asset(
                'assets/images/iconss.jpg', // Custom icon for the drawer
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      drawer: MainDrawer(), // Include the main drawer widget
      body: selectedPageIndex < pages.length
          ? pages[selectedPageIndex] // Show the selected page
          : pages[0], // Fallback to the first page if index is invalid
      bottomNavigationBar: CustomBottomNavigationBar(
        onPageSelect: _onPageSelected, // Use _onPageSelected for handling tab changes
      ),
    );
  }
}
