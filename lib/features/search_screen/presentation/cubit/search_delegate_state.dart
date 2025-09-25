part of 'search_delegate_cubit.dart';

sealed class SearchDelegateState extends Equatable {
  const SearchDelegateState();

  @override
  List<Object> get props => [];
}

final class SearchDelegateInitial extends SearchDelegateState {}

final class SearchDelegateSuccess extends SearchDelegateState {
  final List<WilayahEntity> wilayahEntity;

  const SearchDelegateSuccess(this.wilayahEntity);
}

final class SearchDelegateError extends SearchDelegateState {
  final String message;

  const SearchDelegateError(this.message);
}

final class SearchDelegateLoading extends SearchDelegateState {}
