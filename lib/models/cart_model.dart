import 'product_model.dart';

class CartModel {
  final String userId;
  final ProductModel product;
  final int count;

  CartModel({required this.userId, required this.product, required this.count});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      userId: json['userId'],
      product: ProductModel.fromJson(json['product']),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'product': product.toJson(), 'count': count};
  }
}
