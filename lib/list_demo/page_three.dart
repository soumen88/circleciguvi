import 'package:circleciguvi/list_demo/fake_product_model.dart';
import 'package:circleciguvi/list_demo/get_list_data.dart';
import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {

  List<FakeProductModel> productList = GetListData().prepareData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page three"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index){
            FakeProductModel currentProductData = productList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipOval(
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                            currentProductData.imageUrl
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Name: ${currentProductData.productName}"),
                          Text("Price: Rs. ${currentProductData.price}"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
