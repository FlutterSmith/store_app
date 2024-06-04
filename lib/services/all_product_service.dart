import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  /// Retrieves a list of all products from the fake store API.
  ///
  /// This function sends an HTTP GET request to the specified URL and
  /// decodes the response body into a list of [ProductModel] objects.
  /// It returns a [Future] that completes with the list of products.
  Future<List<ProductModel>> products() async {
    // Send an HTTP GET request to the fake store API.
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );

    // Decode the response body into a list of dynamic objects.

    // Initialize an empty list to store the products.
    List<ProductModel> productsList = [];

    // Iterate over the data and convert each element to a ProductModel.
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }

    // Return the list of products.
    return productsList;
  }
}
