class ProductListModel {
  ProductListModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<Product> products;
  final int? total;
  final int? skip;
  final int? limit;

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x))),
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
    );
  }

  Map<String, dynamic> toJson() => {
        "products": products.map((x) => x?.toJson()).toList(),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Product {
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

  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String> images;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      discountPercentage: json["discountPercentage"],
      rating: double.parse(json["rating"].toString()),
      stock: json["stock"],
      brand: json["brand"],
      category: json["category"],
      thumbnail: json["thumbnail"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": images.map((x) => x).toList(),
      };
}
