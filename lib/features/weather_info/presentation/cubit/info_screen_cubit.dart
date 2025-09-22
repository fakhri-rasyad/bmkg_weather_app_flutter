import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/cuaca_entity.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/response_entity.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/usecase/get_wilayah_code_usecase.dart';
import 'package:bmkg_weather_app_flutter/features/onboarding/domain/usecase/get_wilayah_cuaca_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
part 'info_screen_state.dart';

class InfoScreenCubit extends Cubit<InfoScreenState> {
  InfoScreenCubit(this.getCode, this.getCuaca) : super(InfoScreenInitial());
  GetWilayahCodeUsecase getCode;
  GetWilayahCuacaUsecase getCuaca;

  InfoScreenState get currentState => state;

  Future<void> getUserCode() async {
    final userLocation = await getUsersLocation();
    emit(InfoScreenLoading());
    if (userLocation != null) {
      try {
        final code = await getCode.call(userLocation);
        code.fold(
          (error) {
            emit(InfoScreenError(error));
          },
          (value) {
            getWilayahCuace(value);
          },
        );
      } catch (e) {
        emit(InfoScreenError(e.toString()));
      }
    }
  }

  Future<String?> getUsersLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(InfoScreenError("GPS belum dinyalakan"));
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(InfoScreenError("Permission tidak diberikan"));
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(InfoScreenError("Tidak bisa meminta permission permanen"));
      return null;
    }

    final position = await Geolocator.getCurrentPosition();

    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      return placemarks.first.subLocality;
    } catch (e) {
      emit(InfoScreenError("Geocoder unavailable: $e"));
      print(e);
      return null;
    }
  }

  Future<void> getWilayahCuace(String kodeWilayah) async {
    final response = await getCuaca.call(kodeWilayah);
    emit(InfoScreenLoading());
    response.fold(
      (onError) {
        emit(InfoScreenError(onError));
        print(onError);
      },
      (onSuccess) {
        emit(InfoScreenCuacaLoaded(onSuccess, onSuccess.cuacaEntity.first));
        print(onSuccess.cuacaEntity.first);
      },
    );
  }
}
