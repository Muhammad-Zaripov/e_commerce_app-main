import 'product_model.dart';

class CartModel {
  final int count;
  final String data_time;
  final ProductModel product;
  final int total_price;
  final String user_email;

  CartModel({
    required this.count,
    required this.data_time,
    required this.product,
    required this.total_price,
    required this.user_email,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    count: json['count'],
    data_time: json['data_time'],
    product: ProductModel.fromJson(json['product']),
    total_price: json['total_price'],
    user_email: json['user_email'],
  );

  Map<String, dynamic> toJson() => {
    'count': count,
    'data_time': data_time,
    'product': product.toJson(),
    'total_price': total_price,
    'user_email': user_email,
  };

  CartModel copyWith({
    int? count,
    String? data_time,
    ProductModel? product,
    int? total_price,
    String? user_email,
  }) => CartModel(
    count: count ?? this.count,
    data_time: data_time ?? this.data_time,
    product: product ?? this.product,
    total_price: total_price ?? this.total_price,
    user_email: user_email ?? this.user_email,
  );
}
