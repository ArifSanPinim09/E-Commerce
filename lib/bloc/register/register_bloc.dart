// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:ecomerce/data/datasource/auth_remote_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecomerce/data/model/request/register_request_model.dart';
import 'package:ecomerce/data/model/response/auth_response_model.dart';
part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDataSource authRemoteDataSource;
  RegisterBloc(
    this.authRemoteDataSource,
  ) : super(const _Initial()) {
    on<_DoRegister>((event, emit) async {
      emit(const _Loading());
      final result =
          await authRemoteDataSource.register(event.registerRequestModel);
      result.fold(
        (l) => emit(const _Error()),
        (r) => emit(_Success(r)),
      );
    });
  }
}
