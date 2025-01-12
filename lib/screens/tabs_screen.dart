import 'package:flutter/material.dart';
import 'package:hungroo/screens/categories_screen.dart';
import 'package:hungroo/screens/favourites_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungroo/widgets/main_drawer.dart';
import 'package:hungroo/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> pages;
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pages = [
      CategoriesScreen(),
      FavouritesScreen(widget.favouriteMeals),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Text(
              ' ',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 210,
            ),
            Image.asset(
              'assets/images/crown.png',
              height: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.notifications_active_outlined),
          ],
        ),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              margin: const EdgeInsets.only(
                  left: 16.0, top: 10.0), // Adjust margin here
              child: Image.asset(
                'assets/images/iconss.jpg', // Custom icon for the drawer
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        // bottom: TabBar(
        //   labelColor: Colors.white70,
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.category),
        //       text: 'Categories',
        //     ),
        //     Tab(
        //       icon: Icon(Icons.star),
        //       text: 'Starred',
        //     )
        //   ],
        // ),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Color.fromARGB(255, 228, 81, 81),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white70,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 228, 81, 81),
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Starred'),
        ],
      ),
      // TabBarView(
      //   children: [
      //     CategoriesScreen(),
      //     FavouritesScreen(),
      //   ],
      // ),
    );
  }
}
