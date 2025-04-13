import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/view_models/user_viewmodel.dart';
import 'package:e_commerce_app/views/home_screen/screen/home_screen.dart';
import 'package:e_commerce_app/views/login_screen/widgets/password_text_from_field_widget%20copy.dart';
import 'package:flutter/material.dart';

import '../../register_screen/screen/register_screen.dart';
import '../widgets/email_text_from_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userViewmodel = UserViewmodel();
  final formKey = GlobalKey<FormState>();
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();
  UserModel? user;
  bool isLoading = false;
  void login() async {
    if (formKey.currentState!.validate()) {
      final email = _loginEmailController.text;
      final password = _loginPasswordController.text;
      setState(() {
        isLoading = true;
      });
      user = await userViewmodel.login(email: email, password: password);
      setState(() {
        isLoading = false;
      });
      if (user == null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bunday foydalanuvchi topilmadi')),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: Text('Tizimga kirish'),
        backgroundColor: Colors.grey.shade500,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 300),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              EmailTextFromFieldWidget(controller: _loginEmailController),
              PasswordTextFromFieldWidget(controller: _loginPasswordController),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  'Ro\'yxatdan o\'tish',
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: Colors.grey.shade600),
        onPressed: login,
        child:
            isLoading
                ? SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(color: Colors.grey.shade500),
                )
                : Text('Kirish', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
