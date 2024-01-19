part of 'category_products_cubit.dart';

@immutable
sealed class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}

final class CategoryProductsLoading extends CategoryProductsState {}
final class CategoryProductsSuccess extends CategoryProductsState {}
final class CategoryProductsFailure extends CategoryProductsState {
  final String errMessage;

  CategoryProductsFailure({required this.errMessage});
}

final class AllProductSuccess extends CategoryProductsState {}
final class AllProductLoading extends CategoryProductsState {}
final class AllProductFailure extends CategoryProductsState {
  final String errMessage;

  AllProductFailure({required this.errMessage});
}

