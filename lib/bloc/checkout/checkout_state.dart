part of 'checkout_bloc.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {
  List<Product> items;

  CheckoutSuccess({
    required this.items,
  });
}

final class CheckoutError extends CheckoutState {}
