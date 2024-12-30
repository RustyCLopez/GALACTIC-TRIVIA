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
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE scores(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            score INTEGER,
            totalQuestions INTEGER,
            timestamp TEXT
          )
          ''',
        );
      },
    );
  }

  Future<int> insertScore(int score, int totalQuestions) async {
    try {
      final db = await database;
      return await db.insert(
        'scores',
        {
          'score': score,
          'totalQuestions': totalQuestions,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
    } catch (e) {
      debugPrint('Error inserting score: $e');
      return -1;
    }
  }

  Future<List<Map<String, dynamic>>> fetchScores() async {
    try {
      final db = await database;
      return await db.query('scores', orderBy: 'timestamp DESC');
    } catch (e) {
      debugPrint('Error fetching scores: $e');
      return [];
    }
  }
}

void main() {
  runApp(const PlanetQuizApp());
}

class PlanetQuizApp extends StatelessWidget {
  const PlanetQuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planet Quiz',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Arial',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ),
      home: const PlanetQuizPage(),
    );
  }
}

class PlanetQuizPage extends StatefulWidget {
  const PlanetQuizPage({Key? key}) : super(key: key);

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
        title: const Text('Planet Quiz'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: _currentQuestionIndex < _questions.length
              ? Quiz(
                  questionText:
                      _questions[_currentQuestionIndex]['question'] as String,
                  answers: _questions[_currentQuestionIndex]['answers']
                      as List<Map<String, Object>>,
                  answerQuestion: _answerQuestion,
                )
              : Result(
                  score: _score,
                  totalQuestions: _questions.length,
                ),
        ),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  final String questionText;
  final List<Map<String, Object>> answers;
  final Function(int) answerQuestion;

  const Quiz({
    Key? key,
    required this.questionText,
    required this.answers,
    required this.answerQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questionText,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...answers.map((answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () => answerQuestion(answer['score'] as int),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.purpleAccent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        answer['text'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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

  const Result({Key? key, required this.score, required this.totalQuestions})
      : super(key: key);

  void _saveScore(BuildContext context) async {
    final result = await DatabaseHelper().insertScore(score, totalQuestions);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(result > 0 ? 'Success' : 'Error'),
        content: Text(result > 0
            ? 'Score saved successfully!'
            : 'Failed to save the score.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _viewHistory(BuildContext context) async {
    final scores = await DatabaseHelper().fetchScores();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => HistoryPage(scores: scores),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Your Score: $score / $totalQuestions',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _saveScore(context),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  backgroundColor: Colors.purpleAccent,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Save Score'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _viewHistory(context),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('View History'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> scores;

  const HistoryPage({Key? key, required this.scores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score History'),
      ),
      body: ListView.builder(
        itemCount: scores.length,
        itemBuilder: (ctx, index) {
          final score = scores[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.score, color: Colors.deepPurple),
              title: Text(
                'Score: ${score['score']} / ${score['totalQuestions']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Date: ${score['timestamp']}',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
