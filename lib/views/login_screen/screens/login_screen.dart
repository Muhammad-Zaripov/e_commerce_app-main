import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/service/user_server.dart';
import 'package:e_commerce_app/views/home_screen/screen/home_screen.dart';
import 'package:e_commerce_app/views/register_screen/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  AppService appService = AppService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String errorMessage = "";

  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    userLoding();
  }

  void userLoding() async {
    users = await appService.getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 185, 234),
      appBar: AppBar(title: Text("Log in")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (errorMessage != "")
              Text(errorMessage, style: TextStyle(color: Colors.red)),
            SizedBox(height: 10),

            SizedBox(
              width: 300,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  label: Text("email"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("password"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String inputEmail = email.text;
                String inputPassword = password.text;

                if (inputEmail == "" || inputPassword == "") {
                  setState(() {
                    errorMessage = "Email or password cannot be empty";
                  });
                } else {
                  bool isRegistered = false;
                  for (var user in users) {
                    if (user.email == inputEmail &&
                        user.password == inputPassword) {
                      isRegistered = true;
                      break;
                    }
                  }

                  if (isRegistered) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => HomeScreen()),
                    );
                    setState(() {
                      errorMessage = "";
                    });
                  } else {
                    setState(() {
                      errorMessage = "Wrong email or password";
                    });
                  }
                }
              },
              child: Text("Log In"),
            ),
            SizedBox(height: 30),
            Text("Don't have an account?"),
            SizedBox(height: 5),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text("Register here"),
            ),
          ],
        ),
      ),
    );
  }
}
