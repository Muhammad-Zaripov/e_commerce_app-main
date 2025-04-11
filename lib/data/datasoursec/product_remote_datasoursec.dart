import 'dart:convert';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasoursec {
  final String baseUrl =
      'https://dars46-823de-default-rtdb.firebaseio.com/shop/products.json';

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products.json'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;

        return data.entries.map((entry) {
          return ProductModel.fromJson(entry.value);
        }).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<void> addProduct(ProductModel product) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/products.json'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(product.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to add product');
      }
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }
}
