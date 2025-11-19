import 'package:circleciguvi/base/api_repository.dart';
import 'package:circleciguvi/base/logger_utils.dart';
import 'package:circleciguvi/commonwidgets/display_error_widget.dart';
import 'package:circleciguvi/commonwidgets/display_loading_widget.dart';
import 'package:circleciguvi/productdisplay/product_model.dart';
import 'package:circleciguvi/productdisplay/rating_model.dart';
import 'package:circleciguvi/productdisplay/states/product_display_screen_states.dart';
import 'package:circleciguvi/productdisplay/viewmodel/product_display_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';

import 'events/product_display_screen_events.dart';

///Diligent student
class ApiDemonstrationScreen extends StatelessWidget {

  final _apiRepository = ApiRepository();
  final _logger = LoggerUtils();
  final _TAG = "ApiDemonstrationScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ProductDisplayBloc()..add(const ProductDisplayScreenEvents.Initialize()),
        child: BlocConsumer<ProductDisplayBloc, ProductDisplayScreenStates>(
            listener: (BuildContext context, ProductDisplayScreenStates state){

            },
            builder: (BuildContext context, ProductDisplayScreenStates state){
                return state.when(
                    DisplayLoading: (){
                      return DisplayLoadingWidget();
                    },
                    ProductList: (List<ProductModel> productList){
                      return Scaffold(
                        body: ListView.builder(
                            itemCount: productList.length,
                            itemBuilder: (BuildContext context, int index){
                              ProductModel currentProduct = productList[index];
                              return Card(
                                child: Column(
                                  children: [
                                    Image.network(
                                        currentProduct.image,
                                        width: 200,
                                        height: 200,
                                    ),
                                    Text(
                                        currentProduct.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,

                                        ),
                                        textAlign: TextAlign.center,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Price ${currentProduct.price}"),
                                        StarRating(
                                          rating: currentProduct.rating?.rate.toDouble() ?? 0.0,
                                          allowHalfRating: false,
                                          onRatingChanged: (double rating){

                                          },
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              );
                            }
                        ),
                      );
                    },
                    Error: (String errorMessage){
                      return DisplayErrorWidget(errorMessage: errorMessage);
                    }
                );
            },
        ),
    );
  }
}
