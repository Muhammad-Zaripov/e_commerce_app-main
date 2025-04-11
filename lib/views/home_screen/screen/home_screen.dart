import 'package:e_commerce_app/views/basket_screen/screen/basket_screen.dart';
import 'package:flutter/material.dart';

import '../../prduct_screen/screen/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Badge(
              label: Text("1"),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BasketScreen()),
                  );
                },
                icon: Icon(Icons.shopping_basket_sharp),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (contex, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductScreen()),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListTile(
                tileColor: Colors.grey.shade600,
                trailing: Image.network(
                  'https://avatars.mds.yandex.net/i?id=ab74edcb3b42a90c68db898a6cf5bcfd61bf7590-5280579-images-thumbs&n=13',
                ),
                title: Text(
                  'Olma',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
