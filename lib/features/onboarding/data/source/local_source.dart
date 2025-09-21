import 'package:bmkg_weather_app_flutter/core/data_source/local/database_service.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/wilayah.dart';

abstract class LocalDataSource {
  Future<Wilayah?> getWilayahCode(String sublocationName);
}

class LocalDataSourceImplementation implements LocalDataSource {
  DatabaseService service;

  LocalDataSourceImplementation(this.service);

  @override
  Future<Wilayah?> getWilayahCode(String sublocationName) async {
    final database = service.database;

    List<Map> maps = await database.query(
      "wilayah",
      columns: ["kode", "nama"],
      where: 'nama = ?',
      whereArgs: [sublocationName],
    );

    if (maps.isNotEmpty) {
      return Wilayah.fromMap(maps.first);
    }

    return null;
  }
}
