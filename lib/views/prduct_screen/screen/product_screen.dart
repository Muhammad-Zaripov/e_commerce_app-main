import 'package:flutter/material.dart';

import '../../order_screen/screen/order_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int counter = 0;
  int productPrice = 5;
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      primary: false,
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://avatars.mds.yandex.net/i?id=ab74edcb3b42a90c68db898a6cf5bcfd61bf7590-5280579-images-thumbs&n=13',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 50,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 145,
                  children: [
                    Text(
                      'Banan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '5\$',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (counter > 0) {
                            counter--;
                            totalPrice = totalPrice - productPrice;
                          }
                        });
                      },
                      child: Text(
                        '-',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                    Text(
                      '$counter',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          counter++;
                          totalPrice = counter * productPrice;
                        });
                      },
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Umumiy narx:  ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '${totalPrice}\$',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: Colors.grey.shade600),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderScreen()),
          );
        },
        child: Text('Buyurtma berish', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
