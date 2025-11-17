import 'package:circleciguvi/list_demo/fake_product_model.dart';

class GetListData{

  List<FakeProductModel> prepareData(){
    FakeProductModel productOne = FakeProductModel(
        imageUrl: "https://fastly.picsum.photos/id/19/2500/1667.jpg?hmac=7epGozH4QjToGaBf_xb2HbFTXoV5o8n_cYzB7I4lt6g",
        productName: "Wall paper",
        price: 200
    );

    FakeProductModel productTwo = FakeProductModel(
        imageUrl: "https://fastly.picsum.photos/id/21/3008/2008.jpg?hmac=T8DSVNvP-QldCew7WD4jj_S3mWwxZPqdF0CNPksSko4",
        productName: "Female shoes",
        price: 300
    );

    FakeProductModel productThree = FakeProductModel(
        imageUrl: "https://fastly.picsum.photos/id/9/5000/3269.jpg?hmac=cZKbaLeduq7rNB8X-bigYO8bvPIWtT-mh8GRXtU3vPc",
        productName: "Apple macbook",
        price: 800
    );

    FakeProductModel productFour = FakeProductModel(
        imageUrl: "https://fastly.picsum.photos/id/12/2500/1667.jpg?hmac=Pe3284luVre9ZqNzv1jMFpLihFI6lwq7TPgMSsNXw2w",
        productName: "Calm beach Wallpaper",
        price: 200
    );

    FakeProductModel productFive = FakeProductModel(
        imageUrl: "https://fastly.picsum.photos/id/26/4209/2769.jpg?hmac=vcInmowFvPCyKGtV7Vfh7zWcA_Z0kStrPDW3ppP0iGI",
        productName: "Men's Accessories",
        price: 1000
    );

    List<FakeProductModel> productList = [];

    productList.add(productOne);
    productList.add(productTwo);
    productList.add(productThree);
    productList.add(productFour);
    productList.add(productFive);

    return productList;

  }
}