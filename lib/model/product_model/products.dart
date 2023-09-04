class ProductsResponse {
  List<Product> products;
  int total;
  int skip;
  int limit;

  ProductsResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      products: List<Product>.from(
          json['products'].map((productMap) => Product.fromMap(productMap))),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class Product {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage; // Change to double
  double rating; // Change to double
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      discountPercentage:
          (map['discountPercentage'] as num).toDouble(), // Convert to double
      rating: (map['rating'] as num).toDouble(), // Convert to double
      stock: map['stock'],
      brand: map['brand'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: List<String>.from(map['images']),
    );
  }
}
