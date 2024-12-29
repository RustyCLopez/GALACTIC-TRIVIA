import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Import the HomeScreen class from home_screen.dart
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/solar.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Text(
                  'Galactic Trivia',
                  style: GoogleFonts.bigelowRules(
                    color: Colors.white,
                    fontSize: 72.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 180.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    side: BorderSide(color: Colors.white, width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 48.0),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    'Play',
                    style: GoogleFonts.lato(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
