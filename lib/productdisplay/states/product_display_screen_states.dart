import 'package:circleciguvi/productdisplay/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_display_screen_states.freezed.dart';

@freezed
sealed class ProductDisplayScreenStates with _$ProductDisplayScreenStates {
  const factory ProductDisplayScreenStates.DisplayLoading() = ProductScreenLoading;
  const factory ProductDisplayScreenStates.ProductList(List<ProductModel> productList) = ProductScreenList;
  const factory ProductDisplayScreenStates.Error(String errorMessage) = DisplayError;
}