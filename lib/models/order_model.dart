import 'product_model.dart';

class OrderModel {
  final int count;
  final ProductModel product;
  final int total_price;
  final String user_email;

  OrderModel({
    required this.count,
    required this.product,
    required this.total_price,
    required this.user_email,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    count: json['count'],
    product: ProductModel.fromJson(json['product']),
    total_price: json['total_price'],
    user_email: json['user_email'],
  );

  Map<String, dynamic> toJson() => {
    'count': count,
    'product': product.toJson(),
    'total_price': total_price,
    'user_email': user_email,
  };

  OrderModel copyWith({
    int? count,
    ProductModel? product,
    int? total_price,
    String? user_email,
  }) => OrderModel(
    count: count ?? this.count,
    product: product ?? this.product,
    total_price: total_price ?? this.total_price,
    user_email: user_email ?? this.user_email,
  );
}
