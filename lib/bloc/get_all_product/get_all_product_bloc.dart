import 'package:bloc/bloc.dart';
import 'package:ecomerce/data/datasource/product_datacource/product_remote_datasource.dart';
import 'package:ecomerce/data/model/response/list_product_response_model.dart';
import 'package:meta/meta.dart';

part 'get_all_product_event.dart';
part 'get_all_product_state.dart';

class GetAllProductBloc extends Bloc<GetAllProductEvent, GetAllProductState> {
  final ProductRemoteDataSource productRemoteDataSource;
  GetAllProductBloc(this.productRemoteDataSource)
      : super(GetAllProductInitial()) {
    on<GetAllProductEvent>((event, emit) async {
      emit(GetAllProductLoading());
      final result = await productRemoteDataSource.getAllProduct();
      result.fold(
        (l) => emit(GetAllProductError()),
        (r) => emit(GetAllProductSuccess(data: r)),
      );
    });
  }
}
