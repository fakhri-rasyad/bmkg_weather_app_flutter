part of 'info_screen_cubit.dart';

abstract class InfoScreenState {}

final class InfoScreenInitial extends InfoScreenState {}

final class InfoScreenLoading extends InfoScreenState {}

final class InfoScreenDataLoaded extends InfoScreenState {
  String kode;

  InfoScreenDataLoaded(this.kode);
}

final class InfoScreenError extends InfoScreenState {
  String message;
  InfoScreenError(this.message);
}

final class InfoScreenCuacaLoaded extends InfoScreenState {
  ResponseEntity response;
  CuacaEntity cuacaData;
  InfoScreenCuacaLoaded(this.response, this.cuacaData);
}
