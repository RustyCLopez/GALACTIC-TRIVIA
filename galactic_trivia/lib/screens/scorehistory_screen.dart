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
          '''
          CREATE TABLE scores(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            score INTEGER NOT NULL,
            totalQuestions INTEGER NOT NULL,
            timestamp TEXT NOT NULL
          )
          ''',
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
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getScores() async {
    final db = await database;
    return await db.query('scores', orderBy: 'timestamp DESC');
  }
}
