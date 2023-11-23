part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = _Initial;
  const factory AccountState.loading() = _Loading;
  const factory AccountState.success(
      ListOrderResponseModel listOrderResponseModel) = _Success;
  const factory AccountState.error() = _Error;
}
