import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'quiz_scores.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE scores(id INTEGER PRIMARY KEY AUTOINCREMENT, score INTEGER, totalQuestions INTEGER, timestamp TEXT)',
        );
      },
    );
  }

  Future<int> insertScore(int score, int totalQuestions) async {
    final db = await database;
    return await db.insert(
      'scores',
      {
        'score': score,
        'totalQuestions': totalQuestions,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  Future<List<Map<String, dynamic>>> getScores() async {
    final db = await database;
    return await db.query('scores', orderBy: 'timestamp DESC');
  }
}

class PlanetQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planet Quiz',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.deepPurple,
      ),
      home: PlanetQuizPage(),
    );
  }
}

class PlanetQuizPage extends StatefulWidget {
  @override
  _PlanetQuizPageState createState() => _PlanetQuizPageState();
}

class _PlanetQuizPageState extends State<PlanetQuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the largest planet in our solar system?',
      'answers': [
        {'text': 'Earth', 'score': 0},
        {'text': 'Jupiter', 'score': 1},
        {'text': 'Saturn', 'score': 0},
      ],
    },
    {
      'question': 'Which planet is known as the "Red Planet"?',
      'answers': [
        {'text': 'Venus', 'score': 0},
        {'text': 'Mars', 'score': 1},
        {'text': 'Mercury', 'score': 0},
      ],
    },
    {
      'question': 'Which planet is closest to the Sun?',
      'answers': [
        {'text': 'Earth', 'score': 0},
        {'text': 'Venus', 'score': 0},
        {'text': 'Mercury', 'score': 1},
      ],
    },
    {
      'question': 'Which galaxy is Earth located in?',
      'answers': [
        {'text': 'Andromeda Galaxy', 'score': 0},
        {'text': 'Milky Way Galaxy', 'score': 1},
        {'text': 'Sombrero Galaxy', 'score': 0},
      ],
    },
    {
      'question': 'What is the closest galaxy to the Milky Way?',
      'answers': [
        {'text': 'Triangulum Galaxy', 'score': 0},
        {'text': 'Andromeda Galaxy', 'score': 1},
        {'text': 'Whirlpool Galaxy', 'score': 0},
      ],
    },
    {
      'question': 'Which planet is known for its beautiful rings?',
      'answers': [
        {'text': 'Jupiter', 'score': 0},
        {'text': 'Saturn', 'score': 1},
        {'text': 'Uranus', 'score': 0},
      ],
    },
    {
      'question': 'Which planet is tilted on its side?',
      'answers': [
        {'text': 'Uranus', 'score': 1},
        {'text': 'Neptune', 'score': 0},
        {'text': 'Saturn', 'score': 0},
      ],
    },
    {
      'question': 'What is the smallest planet in our solar system?',
      'answers': [
        {'text': 'Pluto', 'score': 0},
        {'text': 'Mercury', 'score': 1},
        {'text': 'Mars', 'score': 0},
      ],
    },
    {
      'question': 'Which planet has the tallest volcano in the solar system?',
      'answers': [
        {'text': 'Mars', 'score': 1},
        {'text': 'Earth', 'score': 0},
        {'text': 'Mercury', 'score': 0},
      ],
    },
    {
      'question': 'Which galaxy is shaped like a pinwheel?',
      'answers': [
        {'text': 'Andromeda Galaxy', 'score': 0},
        {'text': 'Whirlpool Galaxy', 'score': 1},
        {'text': 'Elliptical Galaxy', 'score': 0},
      ],
    },
    {
      'question': 'Which planet is the hottest in the solar system?',
      'answers': [
        {'text': 'Mercury', 'score': 0},
        {'text': 'Venus', 'score': 1},
        {'text': 'Mars', 'score': 0},
      ],
    },
    {
      'question': 'Which galaxy is the largest in the Local Group?',
      'answers': [
        {'text': 'Milky Way Galaxy', 'score': 0},
        {'text': 'Andromeda Galaxy', 'score': 1},
        {'text': 'Triangulum Galaxy', 'score': 0},
      ],
    },
    {
      'question': 'Which planet has the most moons?',
      'answers': [
        {'text': 'Earth', 'score': 0},
        {'text': 'Saturn', 'score': 0},
        {'text': 'Jupiter', 'score': 1},
      ],
    },
    {
      'question': 'Which galaxy is named for its sombrero-like shape?',
      'answers': [
        {'text': 'Sombrero Galaxy', 'score': 1},
        {'text': 'Cartwheel Galaxy', 'score': 0},
        {'text': 'Pinwheel Galaxy', 'score': 0},
      ],
    },
    {
      'question': 'What type of galaxy is the Milky Way?',
      'answers': [
        {'text': 'Elliptical', 'score': 0},
        {'text': 'Spiral', 'score': 1},
        {'text': 'Irregular', 'score': 0},
      ],
    },
    {
      'question':
          'What planet has a surface covered with sulfuric acid clouds?',
      'answers': [
        {'text': 'Venus', 'score': 1},
        {'text': 'Mars', 'score': 0},
        {'text': 'Neptune', 'score': 0},
      ],
    },
    {
      'question': 'Which planet is known for its Great Red Spot?',
      'answers': [
        {'text': 'Jupiter', 'score': 1},
        {'text': 'Saturn', 'score': 0},
        {'text': 'Uranus', 'score': 0},
      ],
    },
    {
      'question': 'Which planet has a year lasting 88 Earth days?',
      'answers': [
        {'text': 'Mercury', 'score': 1},
        {'text': 'Venus', 'score': 0},
        {'text': 'Earth', 'score': 0},
      ],
    },
    {
      'question':
          'What is the name of the closest large spiral galaxy to Earth?',
      'answers': [
        {'text': 'Andromeda Galaxy', 'score': 1},
        {'text': 'Milky Way Galaxy', 'score': 0},
        {'text': 'Triangulum Galaxy', 'score': 0},
      ],
    },
    {
      'question': 'What is the main component of the Milky Way Galaxy?',
      'answers': [
        {'text': 'Gas and dust', 'score': 1},
        {'text': 'Lava', 'score': 0},
        {'text': 'Ice', 'score': 0},
      ],
    },
    // add more questions
  ];

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planet Quiz'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Planet Quiz',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: _currentQuestionIndex < _questions.length
                    ? Quiz(
                        questionText: _questions[_currentQuestionIndex]
                            ['question'] as String,
                        answers: (_questions[_currentQuestionIndex]['answers']
                            as List<Map<String, Object>>),
                        answerQuestion: _answerQuestion,
                      )
                    : Result(
                        score: _score,
                        totalQuestions: _questions.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  final String questionText;
  final List<Map<String, Object>> answers;
  final Function answerQuestion;

  Quiz(
      {required this.questionText,
      required this.answers,
      required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            color: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                questionText,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20),
          ...answers.map((answer) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () => answerQuestion(answer['score']),
                child: Text(
                  answer['text'] as String,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int score;
  final int totalQuestions;

  Result({required this.score, required this.totalQuestions});

  void _saveScore(BuildContext context) async {
    await DatabaseHelper().insertScore(score, totalQuestions);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Score saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Score',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 20),
        Card(
          color: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '$score / $totalQuestions',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.deepPurple,
          ),
          onPressed: () {
            _saveScore(context);
          },
          child: Text(
            'Save Score',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.deepPurple,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PlanetQuizApp()),
            );
          },
          child: Text(
            'Restart Quiz',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(PlanetQuizApp());
}
