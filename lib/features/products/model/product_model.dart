class ProductModel {
  final String id;
  final String title;
  final String currentPrice;
  final List<String>? photoUrl;

  ProductModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.photoUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      currentPrice: (jsonData['current_price']).toString(),
      photoUrl: List<String>.from(jsonData['photos']),
    );
  }
}
