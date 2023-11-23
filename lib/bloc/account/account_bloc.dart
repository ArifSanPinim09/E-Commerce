// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:ecomerce/data/model/request/order_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ecomerce/data/datasource/product_datacource/order_remote_datasource.dart';
import 'package:ecomerce/data/model/response/list_order_response_model.dart';

part 'account_bloc.freezed.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  AccountBloc(
    this.orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Get>(
      (event, emit) async {
        emit(const _Loading());
        final result = await orderRemoteDatasource.listOrder();
        result.fold(
          (l) => emit(const _Error()),
          (r) => emit(_Success(r)),
        );
      },
    );
  }
}
