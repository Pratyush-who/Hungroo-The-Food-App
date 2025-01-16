import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/QRCodes.png',height: 250,),
          const SizedBox(height: 20),
          Text(
            'Can\'t scan QR\'s yet!',
            style: GoogleFonts.roboto(
              fontSize: 22,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'This feature is around the corner.Stay Tuned..!!',
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
