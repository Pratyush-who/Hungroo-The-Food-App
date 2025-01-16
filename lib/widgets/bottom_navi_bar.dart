import 'package:flutter/material.dart';
import 'package:hungroo/screens/qr_screen.dart';

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

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index for visual feedback
    });
    widget.onPageSelect(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(0, Icons.home_outlined, 'Home'), // Home Icon
                  _buildNavItem(
                      1, Icons.star_border_sharp, 'Starred'), // Categories Icon
                  _buildNavItem(2, Icons.qr_code_scanner, 'QR Scan'), // QR Code Icon
                  _buildNavItem(3, Icons.book_outlined, 'Chefs'), // Favourites Icon
                  _buildNavItem(4, Icons.person_outline, 'Profile'), // Profile Icon
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index), // Handle tap
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
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
            const SizedBox(height: 1),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
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
