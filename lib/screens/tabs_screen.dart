import 'package:flutter/material.dart';
import 'package:hungroo/screens/categories_screen.dart';
import 'package:hungroo/screens/favourites_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hungroo',
style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),
          
              // style: GoogleFonts.poppins(
              //   textStyle: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 20,
              //   ),
              // )
               ),
          bottom: TabBar(
            labelColor: Colors.white70,
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Starred',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavouritesScreen(),
          ],
        ),
      ),
    );
  }
}
