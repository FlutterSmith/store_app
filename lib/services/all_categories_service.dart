import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  /// This class, `AllCategoriesService`, is responsible for fetching all categories from the fake store API.
  ///
  /// The `getAllCategories` method is the only function in this class. It sends an HTTP GET request
  /// to the specified URL, decodes the response body into a list of [CategoryModel] objects,
  /// and returns a [Future] that completes with the list of categories.
  ///
  /// The comment for the `getAllCategories` function is as follows:
  ///
  /// Retrieves a list of all categories from the fake store API.
  /// This function sends an HTTP GET request to the specified URL and
  ///     decodes the response body into a list of [CategoryModel] objects.
  /// It returns a [Future] that completes with the list of categories.
  ///
  /// The `getAllCategories` function does the following:
  /// 1. It sends an HTTP GET request to the fake store API.
  /// 2. It waits for a response from the API.
  /// 3. It decodes the response body into a list of [CategoryModel] objects.
  /// 4. It returns a [Future] that completes with the list of categories.
  ///
  /// The `getAllCategories` function does not take any parameters.
  ///
  /// The return type of the `getAllCategories` function is `Future<List<dynamic>>`.
  /// The `Future` completes with a list of objects, and the specific type of objects
  /// in the list is `dynamic`, meaning their exact type is not known at compile time.
  /// This is because the type of objects in the list will depend on the structure of the
  /// JSON data returned by the API.
  ///
  /// It's worth noting that the exact structure of the JSON data returned by the API
  /// is not specified in the comments, so the actual structure of the data will depend
  /// on the API documentation.
  Future<List<dynamic>> getAllCategories() async {
    // Step 1: Send an HTTP GET request to the fake store API.
    // Step 2: Wait for a response from the API.
    // Step 3: Decode the response body into a list of CategoryModel objects.
    // Step 4: Return a Future that completes with the list of categories.

    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/categories',
    );

    // Decode the response body into a list of dynamic objects.

    // Initialize an empty list to store the categories.
    return data;
  }
}
