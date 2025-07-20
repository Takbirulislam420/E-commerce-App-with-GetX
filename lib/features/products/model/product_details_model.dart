class ProductDetailsModel {
  final String id;
  final String title;
  final String currentPrice;
  final String description;
  final List<String>? colors;
  final List<String>? sizes;
  final List<String>? photoUrl;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.description,
    required this.colors,
    required this.sizes,
    required this.photoUrl,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductDetailsModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      currentPrice: (jsonData['current_price']).toString(),
      photoUrl: List<String>.from(jsonData['photos']),
      description: jsonData['description'],
      colors: List<String>.from(jsonData['colors']),
      sizes: List<String>.from(jsonData['sizes']),
    );
  }
}
