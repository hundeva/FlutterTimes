import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

const String _databaseName = 'flutter_times.db';
const int _databaseVersion = 1;
const String _preferenceStoreName = 'preferences';

Database _database;
Store preferences;

Future<bool> setupDatabase() async {
  try {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);

    _database = await databaseFactoryIo.openDatabase(
      path,
      version: _databaseVersion,
    );

    preferences = _database.getStore(_preferenceStoreName);
    return Future.value(true);
  } catch (e) {
    return Future.value(false);
  }
}
