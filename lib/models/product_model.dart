class ProductModel {
  final String image;
  final int price;
  final String title;

  ProductModel({
    required this.image,
    required this.price,
    required this.title,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json['image'],
        price: json['price'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'price': price,
        'title': title,
      };

  ProductModel copyWith({
    String? image,
    int? price,
    String? title,
  }) =>
      ProductModel(
        image: image ?? this.image,
        price: price ?? this.price,
        title: title ?? this.title,
      );
}
