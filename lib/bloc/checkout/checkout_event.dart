part of 'checkout_bloc.dart';

abstract class CheckoutEvent {}

class AddToCartEvent extends CheckoutEvent {
  final Product product;
  AddToCartEvent({
    required this.product,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class RemoveFromCartEvent extends CheckoutEvent {
  final Product product;
  RemoveFromCartEvent({
    required this.product,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
