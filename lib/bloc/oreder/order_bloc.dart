// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecomerce/data/datasource/product_datacource/order_remote_datasource.dart';
import 'package:ecomerce/data/model/request/order_request_model.dart';
import 'package:ecomerce/data/model/response/order_response_model.dart';
part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  OrderBloc(
    this.orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_DoOrder>((event, emit) async {
      emit(const _Loading());
      final result = await orderRemoteDatasource.order(
        event.orderRequestModel,
      );
      result.fold(
        (l) => emit(const _Error()),
        (r) => emit(_Success(r)),
      );
    });
  }
}
