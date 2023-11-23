// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:ecomerce/data/model/response/auth_response_model.dart';

import 'package:ecomerce/data/datasource/auth_remote_datasource.dart';
import 'package:ecomerce/data/model/request/login_request_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDataSource authRemoteDataSource;
  LoginBloc(
    this.authRemoteDataSource,
  ) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await authRemoteDataSource.login(event.loginRequestModel);
      result.fold(
        (l) => emit(LoginError()),
        (r) => emit(LoginSuccess(authReponseModel: r)),
      );
    });
  }
}
