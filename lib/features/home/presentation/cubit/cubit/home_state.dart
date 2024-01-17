part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class WomansProductSuccess extends HomeState {}
final class WomansProductLoading extends HomeState {}
final class WomansProductFailure extends HomeState {
  final String errMessage;

  WomansProductFailure({required this.errMessage});
}
final class MensProductSuccess extends HomeState {}
final class MensProductLoading extends HomeState {}
final class MensProductFailure extends HomeState {
  final String errMessage;

  MensProductFailure({required this.errMessage});
}

final class GetCategoriesSuccess extends HomeState {}
final class GetCategoriesLoading extends HomeState {}
final class GetCategoriesFailure extends HomeState {
  final String errMessage;

  GetCategoriesFailure({required this.errMessage});
}




