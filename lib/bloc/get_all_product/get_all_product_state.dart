part of 'get_all_product_bloc.dart';

@immutable
sealed class GetAllProductState {}

final class GetAllProductInitial extends GetAllProductState {}

final class GetAllProductLoading extends GetAllProductState {}

final class GetAllProductSuccess extends GetAllProductState {
  final ListProductResponseModel data;

  GetAllProductSuccess({required this.data});
}

final class GetAllProductError extends GetAllProductState {}
