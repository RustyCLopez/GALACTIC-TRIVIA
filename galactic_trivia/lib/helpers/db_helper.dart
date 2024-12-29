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
    // Get the path to the database directory
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'quiz_scores.db');

    // Open the database, creating the table if it doesn't exist
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE scores(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            score INTEGER NOT NULL,
            totalQuestions INTEGER NOT NULL,
            timestamp TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Insert a new score into the database
  Future<int> insertScore(int score, int totalQuestions) async {
    final db = await database;
    return await db.insert(
      'scores',
      {
        'score': score,
        'totalQuestions': totalQuestions,
        'timestamp': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all saved scores
  Future<List<Map<String, dynamic>>> getScores() async {
    final db = await database;
    return await db.query(
      'scores',
      orderBy: 'timestamp DESC',
    );
  }

  // Delete a specific score by ID
  Future<int> deleteScore(int id) async {
    final db = await database;
    return await db.delete(
      'scores',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete all scores
  Future<int> deleteAllScores() async {
    final db = await database;
    return await db.delete('scores');
  }
}
