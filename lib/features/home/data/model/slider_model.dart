class SliderModel {
  final String id;
  final String photoImage;
  final String description;
  final String brand;

  SliderModel({
    required this.id,
    required this.photoImage,
    required this.description,
    required this.brand,
  });

  factory SliderModel.fromJson(Map<String, dynamic> jsonData) {
    return SliderModel(
      id: jsonData['id'] ?? '',
      photoImage: jsonData['photo_url'] ?? '',
      description: jsonData['description'] ?? '',
      brand: jsonData['brand'] ?? '',
    );
  }
}
