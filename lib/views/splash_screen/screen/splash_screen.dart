import 'package:e_commerce_app/view_models/user_viewmodel.dart';
import 'package:e_commerce_app/views/home_screen/screen/home_screen.dart';
import 'package:e_commerce_app/views/login_screen%20copy/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewmodel = UserViewmodel();

    return Scaffold(
      backgroundColor: Color(0xFF3C3C3C),
      body: FutureBuilder(
        future: userViewmodel.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final user = snapshot.data;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (context) => user == null ? LoginScreen() : HomeScreen(),
              ),
            );
          }
          return Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  'https://i.pinimg.com/originals/5e/b2/e4/5eb2e48773be3dfdd8f4b711f71a651a.gif',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
