import 'product_model.dart';

class OrderModel {
  final String userId;
  final ProductModel product;
  final int count;

  OrderModel({
    required this.userId,
    required this.product,
    required this.count,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      userId: json['userId'],
      product: ProductModel.fromJson(json['product']),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'product': product.toJson(), 'count': count};
  }
}
