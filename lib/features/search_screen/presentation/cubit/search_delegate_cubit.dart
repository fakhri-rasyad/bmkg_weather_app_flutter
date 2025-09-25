import 'package:bmkg_weather_app_flutter/features/onboarding/domain/entity/wilayah_entity.dart';
import 'package:bmkg_weather_app_flutter/features/search_screen/domain/usecase/search_location_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_delegate_state.dart';

class SearchDelegateCubit extends Cubit<SearchDelegateState> {
  SearchDelegateCubit(this.searchLocationUsecase)
    : super(SearchDelegateInitial());

  SearchLocationUsecase searchLocationUsecase;

  void searchLocation(String query) async {
    emit(SearchDelegateLoading());
    if (query.isEmpty) {
      emit(SearchDelegateInitial());
      return;
    }
    try {
      final search = await searchLocationUsecase.call(query);
      search.fold(
        (onError) {
          emit(SearchDelegateError(onError));
        },
        (onSuccess) {
          emit(SearchDelegateSuccess(onSuccess));
        },
      );
    } catch (e) {
      emit(SearchDelegateError("Error: $e"));
      return;
    }
  }
}
