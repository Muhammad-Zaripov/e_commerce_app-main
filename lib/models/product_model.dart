import 'package:e_commerce_app/models/user_model.dart';

class ProductModel {
  final String image;
  final String name;
  final int price;
  ProductModel({required this.image, required this.name, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'image': image, 'name': name, 'price': price};
  }
}
