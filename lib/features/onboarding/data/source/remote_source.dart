import 'package:bmkg_weather_app_flutter/features/onboarding/data/model/remote_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
      final responseData = RemoteResponse.fromJson(response.data);

      return right(responseData);
    } on DioException catch (e) {
      String errorMsg = "Error saat mengambil data";
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          errorMsg = "Koneksi ke server terlalu lama";
        case DioExceptionType.sendTimeout:
          errorMsg = "Pengiriman data terlalu lama";
        case DioExceptionType.receiveTimeout:
          errorMsg = "Respons dari server terlalu lama";
        case DioExceptionType.badCertificate:
          errorMsg = "Bad Certificate";
        case DioExceptionType.badResponse:
          errorMsg = "Bad Response";
        case DioExceptionType.cancel:
          errorMsg = "Dibatalkan";
        case DioExceptionType.connectionError:
          errorMsg = "Koneksi Gagal";
        case DioExceptionType.unknown:
          errorMsg = "Error saat mengambil data";
      }
      return left(errorMsg);
    } catch (e) {
      return left("Error: ${e.toString()}");
    }
  }
}
