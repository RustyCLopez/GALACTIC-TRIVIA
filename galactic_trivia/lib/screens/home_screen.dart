import 'package:flutter/material.dart';
import 'package:galactic/screens/planetary_profile.dart';
import 'package:galactic/screens/celestial_trivia.dart';
import 'package:galactic/screens/interstellar_quiz.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Galactic Trivia',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 5.0,
      shadowColor: Colors.grey,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildNavigationButton(
              context,
              'Planetary Profile',
              PlanetaryProfile(),
            ),
            _buildNavigationButton(
              context,
              'Celestial Trivia',
              TriviaFlashcardsScreen(),
            ),
            _buildNavigationButton(
              context,
              'Interstellar Quiz',
              PlanetQuizApp(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
      BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          elevation: 8.0,
          shadowColor: Colors.black54,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    ),
  );
}
