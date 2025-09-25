import 'package:bmkg_weather_app_flutter/core/data_source/local/database_service.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/wilayah.dart';

abstract class SearchLocalSource {
  Future<List<Wilayah>> getWilayahCode(String sublocationName);
}

class SearchLocalSourceImplementation implements SearchLocalSource {
  DatabaseService service;

  SearchLocalSourceImplementation(this.service);

  @override
  Future<List<Wilayah>> getWilayahCode(String sublocationName) async {
    if (sublocationName.isEmpty) return [];
    final database = service.database;

    final maps = await database.query(
      "wilayah",
      columns: ["kode", "nama"],
      where:
          "(LENGTH(kode) - LENGTH(REPLACE(kode, '.', ''))) = 3 AND nama LIKE ?",
      whereArgs: ['%$sublocationName%'],
      // orderBy: "nama ASC",
    );

    if (maps.isNotEmpty) {
      return maps.map((e) => Wilayah.fromMap(e)).toList();
    }

    return [];
  }
}
