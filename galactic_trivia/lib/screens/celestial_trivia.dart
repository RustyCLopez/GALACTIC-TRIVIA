import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TriviaFlashcardsScreen extends StatefulWidget {
  @override
  _TriviaFlashcardsScreenState createState() => _TriviaFlashcardsScreenState();
}

class _TriviaFlashcardsScreenState extends State<TriviaFlashcardsScreen> {
  int _currentCardIndex = 0;

  final List<Map<String, String>> _flashcards = [
    {
      'question': 'Did you know?',
      'answer': 'The largest planet in the solar system is Jupiter.'
    },
    {
      'question': 'Did you know?',
      'answer': 'Venus has a day longer than its year.'
    },
    {
      'question': 'Did you know?',
      'answer':
          'Mars is known as the "Red Planet" because of its reddish appearance.'
    },
    {
      'question': 'Did you know?',
      'answer': 'Saturn’s rings are made primarily of ice and rock.'
    },
    {
      'question': 'Did you know?',
      'answer':
          'The Sun is a star that accounts for 99.86% of the mass in our solar system.'
    },
    {
      'question': 'Did you know?',
      'answer': 'Mercury is the closest planet to the Sun.'
    },
    {
      'question': 'Did you know?',
      'answer':
          'Uranus rotates on its side, unlike other planets in the solar system.'
    },
    {
      'question': 'Did you know?',
      'answer':
          'Neptune is the only planet that cannot be seen with the naked eye from Earth.'
    },
  ];

  void _nextCard() {
    setState(() {
      _currentCardIndex = (_currentCardIndex + 1) % _flashcards.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Solar System Trivia',
          style: GoogleFonts.roboto(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black, // AppBar remains black
        elevation: 8,
        iconTheme: IconThemeData(color: Colors.deepPurple),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.jpg'), // Original background
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Card(
                  key: ValueKey<int>(_currentCardIndex),
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.9), // Slight opacity
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _flashcards[_currentCardIndex]['question']!,
                          style: GoogleFonts.roboto(
                            color: Colors.deepPurple.shade900,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _flashcards[_currentCardIndex]['answer']!,
                          style: GoogleFonts.lobster(
                            color: Colors.black87,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: _nextCard,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            backgroundColor: Colors.deepPurple,
                            shadowColor: Colors.deepPurple.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'NEXT',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
