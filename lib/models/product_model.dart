/* 
This class represents a product.
It has the following fields:
- id: an integer representing the product's id
- title: a string representing the product's title
- description: a string representing the product's description
- price: a double representing the product's price
- image: a string representing the product's image
- rating: an instance of the RatingModel class representing the product's rating
*/
class ProductModel {
  //The fields of the ProductModel class are defined here
  final dynamic id;
  final String title;
  final String description;
  final dynamic price;
  final String image;
  final RatingModel? rating;
  final String category;

  /* 
  This is the constructor of the ProductModel class.
  It takes in the following parameters:
  - id: an integer representing the product's id
  - title: a string representing the product's title
  - description: a string representing the product's description
  - price: a double representing the product's price
  - image: a string representing the product's image
  - rating: an instance of the RatingModel class representing the product's rating
  */
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
    required this.category,
  });

  /* 
  This factory method takes in a JSON object and returns a ProductModel instance.
  It extracts the values from the JSON object and passes them to the ProductModel constructor.
  */
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      category: jsonData['category'],
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: jsonData['price'],
      image: jsonData['image'],
      rating: jsonData['rating'] == null
          ? null
          : RatingModel.fromJson(jsonData['rating']),
    );
  }
}

/* 
This class represents a rating for a product.
It has the following fields:
- rate: a double representing the rating's value
- count: an integer representing the number of ratings
*/
class RatingModel {
  final dynamic rate;
  final int count;

  /* 
  This is the constructor of the RatingModel class.
  It takes in the following parameters:
  - rate: a double representing the rating's value
  - count: an integer representing the number of ratings
  */
  RatingModel({
    required this.rate,
    required this.count,
  });

  /* 
  This factory method takes in a JSON object and returns a RatingModel instance.
  It extracts the values from the JSON object and passes them to the RatingModel constructor.
  */
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
