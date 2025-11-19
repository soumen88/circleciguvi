import 'package:circleciguvi/productdisplay/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_display_screen_events.freezed.dart';

/// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
sealed class ProductDisplayScreenEvents with _$ProductDisplayScreenEvents {
  const factory ProductDisplayScreenEvents.Initialize() = LoadDataFromServer;

}