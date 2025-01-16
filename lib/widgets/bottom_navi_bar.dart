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

    //   if (index == 2) {
    //   Navigator.of(context).pushNamed('/qrcode');
    // } else if (index == 3) { // Corrected index for Favourites Screen
    //   Navigator.of(context).pushNamed('/favourites');
    // } else if (index == 4) {
    //   Navigator.of(context).pushNamed('/profile');
    // } else if (index == 1) {
    //   Navigator.of(context).pushNamed('/chefsbook');
    // } else {

    if (index == 2) {
      Navigator.of(context).pushNamed('/qrcode');
    } 
    else if (index == 3) {
      Navigator.of(context).pushNamed('/chefsbook');
    } 
    else if (index == 4) {
      Navigator.of(context).pushNamed('/profile');
    } 
    else {
      widget.onPageSelect(index);
    }
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
              _buildNavItem(0, Icons.home_outlined, ''), // Home Icon
              _buildNavItem(1, Icons.star_border_sharp, ''), // Categories Icon
              _buildNavItem(2, Icons.qr_code_scanner, ''), // QR Code Icon
              _buildNavItem(3, Icons.book_outlined, ''), // Favourites Icon
              _buildNavItem(4, Icons.person_outline, ''), // Profile Icon
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
            width: 45,
            height: 45,
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
