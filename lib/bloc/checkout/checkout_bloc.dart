import 'package:bloc/bloc.dart';
import 'package:ecomerce/data/model/response/list_product_response_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutSuccess(items: const [])) {
    on<AddToCartEvent>((event, emit) {
      final currentState = state as CheckoutSuccess;

      emit(CheckoutLoading());
      emit(CheckoutSuccess(items: [...currentState.items, event.product]));
    });

    on<RemoveFromCartEvent>((event, emit) {
      final currentState = state as CheckoutSuccess;
      currentState.items.remove(event.product);
      emit(CheckoutLoading());
      emit(CheckoutSuccess(items: currentState.items));
    });
  }
}
