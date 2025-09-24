import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/remote_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class RemoteSource {
  Future<Either<String, RemoteResponse>> getWeatherReport(String kodeWilayah);
}

class RemoteSourceImpl implements RemoteSource {
  Dio dio;

  RemoteSourceImpl(this.dio);

  @override
  Future<Either<String, RemoteResponse>> getWeatherReport(
    String kodeWilayah,
  ) async {
    try {
      final response = await dio.get(
        "prakiraan-cuaca",
        queryParameters: {"adm4": kodeWilayah},
      );

      final responseData = await compute<Map<String, dynamic>, RemoteResponse>(
        parseResponse,
        response.data,
      );
      // final responseData = RemoteResponse.fromJson(response.data);

      return right(responseData);
    } on DioException catch (e) {
      String errorMsg = "Error saat mengambil data";
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          errorMsg = "Koneksi ke server terlalu lama";
          break;
        case DioExceptionType.sendTimeout:
          errorMsg = "Pengiriman data terlalu lama";
          break;
        case DioExceptionType.receiveTimeout:
          errorMsg = "Respons dari server terlalu lama";
          break;
        case DioExceptionType.badCertificate:
          errorMsg = "Bad Certificate";
          break;
        case DioExceptionType.badResponse:
          errorMsg = "Bad Response";
          break;
        case DioExceptionType.cancel:
          errorMsg = "Dibatalkan";
          break;
        case DioExceptionType.connectionError:
          errorMsg = "Koneksi Gagal";
          break;
        case DioExceptionType.unknown:
          errorMsg = "Error saat mengambil data";
          break;
      }
      return left(errorMsg);
    } catch (e) {
      return left("Error: ${e.toString()}");
    }
  }
}

RemoteResponse parseResponse(Map<String, dynamic> json) {
  return RemoteResponse.fromJson(json);
}
