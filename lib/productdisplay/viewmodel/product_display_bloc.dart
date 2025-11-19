import 'package:circleciguvi/base/api_repository.dart';
import 'package:circleciguvi/base/logger_utils.dart';
import 'package:circleciguvi/productdisplay/events/product_display_screen_events.dart';
import 'package:circleciguvi/productdisplay/product_model.dart';
import 'package:circleciguvi/productdisplay/states/product_display_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Diligent teacher
class ProductDisplayBloc extends Bloc<ProductDisplayScreenEvents, ProductDisplayScreenStates>{

  final _apiRepository = ApiRepository();
  final _logger = LoggerUtils();
  final _TAG = "ProductDisplayBloc";

  ProductDisplayBloc() : super(const ProductDisplayScreenStates.DisplayLoading()){
    on<LoadDataFromServer>(_loadProductsFromServer);
  }

  Future<void> _loadProductsFromServer(LoadDataFromServer event, Emitter<ProductDisplayScreenStates> emit) async{
    await Future.delayed(Duration(seconds: 5), () async{
      await _apiRepository.hitServerForFetchingProducts().then((List<ProductModel> productList){
        emit(ProductDisplayScreenStates.ProductList(productList));
      }).onError((exception, stackTrace){
        emit(ProductDisplayScreenStates.Error(exception.toString()));
      });

    });

  }

}