import 'dart:convert';

import 'package:circleciguvi/base/logger_utils.dart';
import 'package:circleciguvi/productdisplay/product_model.dart';
import 'package:http/http.dart' as httpPackage;
class ApiRepository{
  final _logger = LoggerUtils();
  final _TAG = "ApiRepository";
  Future<List<ProductModel>> hitServerForFetchingProducts() async{
    String apiUrl = "https://fakestoreapi.com/products";
    List<ProductModel> productList = [];
    final request = await httpPackage.get(Uri.parse(apiUrl));
    switch(request.statusCode){
      case 200 :{
        _logger.log(_TAG, "Status code ${request.statusCode}");
        List<dynamic> productListFromServer = jsonDecode(request.body);
        _logger.log(_TAG, "Total product list ${productListFromServer.length}");
        for(var individualProduct in productListFromServer){
          ProductModel currentProduct = ProductModel.fromJson(individualProduct);
          _logger.log(_TAG, "Current product name ${currentProduct.title}");
          productList.add(currentProduct);
        }
        return Future.value(productList);
      }
      case 404:{
        return Future.error("Status code ${request.statusCode} and endpoint url is invalid");
      }
      case 503:{
        return Future.error("Status code ${request.statusCode} and server is unavailable");
      }
      default:
        return Future.error("Status code ${request.statusCode} and error description ${request.body}");

    }


  }
}