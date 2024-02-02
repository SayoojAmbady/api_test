// product_model.dart
class ProductModel {
  final int id;
  final String name;
  final String brand;
  final String image;

  ProductModel({required this.id, required this.name, required this.brand,required this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name']?? '',
      brand: json['brand'] ?? '',
      image: json['image_link']??'',
    );
  }
}
