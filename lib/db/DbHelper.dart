import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:student_app/db/DbOperation.dart';
import 'package:student_app/models/StudentModel.dart';
import 'package:student_app/utils/constants.dart';

class DbHelper extends DbOperation {
  static Database? _db;
  DbHelper._();
  static final DbHelper instance = DbHelper._();

  Future<Database?> get database async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, db);
    bool dbExists = await File(path).exists();

    if (!dbExists) {
      ByteData data = await rootBundle.load(join('assets/db', db));
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    }
    return await openDatabase(path, version: 1);
  }

  @override
  deleteData(int value) async {
    var db = await database;
    db?.delete(table, where: '$studentId = ?', whereArgs: [value]);
  }

  @override
  getAllData() async {
    var db = await database;
    dynamic users = await db?.query(table);
    return users;
  }

  @override
  getDataById(int value) async {
    var db = await database;
    dynamic user =
        db?.query(table, where: '$studentId = ?', whereArgs: [value]);
    return StudentModel.fromJson(user);
  }

  @override
  insertData(StudentModel user) async {
    print(user.email);
    var db = await database;
    db?.insert(table, user.toJson());
  }

  @override
  updateData(int value, StudentModel user) async {
    var db = await database;
    db?.update(table, user.toJson(),
        where: '$studentId = ?', whereArgs: [value]);
  }
}
