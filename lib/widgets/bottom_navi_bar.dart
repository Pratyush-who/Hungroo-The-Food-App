import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onPageSelect;

  const CustomBottomNavigationBar({
    super.key,
    required this.onPageSelect,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onPageSelect(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85, 
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home_outlined, ''),
              _buildNavItem(1, Icons.book_outlined, ''),
              _buildNavItem(2, Icons.qr_code_scanner, ''),
              _buildNavItem(3, Icons.ads_click_sharp, ''),
              _buildNavItem(4, Icons.person_outline, ''),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        _onItemTapped(index);
        if (index == 3) {
          // Navigate to FavouritesScreen when the 4th button is tapped
          Navigator.of(context).pushNamed('/favourites');
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 45, // Increased size
            height: 45, // Increased size
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.red,
              shape: BoxShape.circle,
              boxShadow: [
                if (isSelected)
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
              ],
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.red : Colors.white,
              size: 30,
            ),
          ),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 1), // Adjusted spacing
            Text(
              label,
              style: TextStyle(
                fontSize: 14, // Slightly increased font size
                color: Colors.white,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
