import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.redAccent, Colors.white], // Keeping a refined gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.qr_code_scanner_sharp, // More relevant icon for Chefs Book
              size: 120,
              color: Colors.white,
            ),
            SizedBox(height: 30),
            Text(
              'Another feature just around the corner',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5, // Increased letter-spacing for better readability
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(3.0, 3.0),
                  ),
                ], // Adding shadow for the text
              ),
            ),
            SizedBox(height: 25),
            Text(
              'This feature is under development.\nStay tuned for updates!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.redAccent,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Button color
                shape: StadiumBorder(), // Rounded button shape
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shadowColor: Colors.black.withOpacity(0.4),
                elevation: 5,
              ),
              child: Text(
                'Notify Me',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
