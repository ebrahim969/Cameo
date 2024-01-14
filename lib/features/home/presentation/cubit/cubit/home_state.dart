part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class NewProductLoading extends HomeState {}
final class NewProductSuccess extends HomeState {}
final class NewProductFailure extends HomeState {
  final String errMessage;

  NewProductFailure({required this.errMessage});
}
final class AllCategoreisLoading extends HomeState {}
final class AllCategoriesSuccess extends HomeState {}
final class AllCategoriesFailure extends HomeState {
  final String errMessage;

  AllCategoriesFailure({required this.errMessage});
}



