import 'package:flutter/material.dart';
import 'package:hungroo/screens/categories_screen.dart';
import 'package:hungroo/screens/favourites_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungroo/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List pages = [
    CategoriesScreen(),
    FavouritesScreen(),
  ];
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/images.png', height: 40),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Hungroo',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),

              // style: GoogleFonts.poppins(
              //   textStyle: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 20,
              //   ),
              // )
            ),
          ],
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
      endDrawer: MainDrawer(),
      body: pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Colors.pinkAccent,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white70,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.pinkAccent,
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
