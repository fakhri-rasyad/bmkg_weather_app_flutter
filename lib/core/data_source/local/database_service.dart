import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  late final Database _database;

  Future<void> init() async {
    var databasePath = await getDatabasesPath();

    String path = "$databasePath/wilayah.db";

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        initializeDatabase(db);
      },
    );
  }

  Database get database => _database;

  Future<void> initializeDatabase(Database db) async {
    try {
      var sqlfile = await rootBundle.loadString('assets/sql/wilayah.sql');

      List<String> sqlCommands = sqlfile.split(";");

      for (String command in sqlCommands) {
        String trimmedCommand = command.trim();
        if (trimmedCommand.isNotEmpty) {
          await db.execute(trimmedCommand);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
