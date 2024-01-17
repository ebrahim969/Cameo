part of 'admin_cubit.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}
final class AddImageLoading extends AdminState {}
final class AddImageSuccess extends AdminState {
  final String imageUrl;

  AddImageSuccess({required this.imageUrl});
}
final class AddImageFailure extends AdminState {
  final String errMessage;

  AddImageFailure({required this.errMessage});
}

final class AllCategoreisLoading extends AdminState {}
final class AllCategoriesSuccess extends AdminState {}
final class AllCategoriesFailure extends AdminState {
  final String errMessage;

  AllCategoriesFailure({required this.errMessage});
}

final class AddProductLoading extends AdminState {}
final class AddProductSuccess extends AdminState {

}
final class AddProductFailure extends AdminState {
  final String errMessage;

  AddProductFailure({required this.errMessage});
}






