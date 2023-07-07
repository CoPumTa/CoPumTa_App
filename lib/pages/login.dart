import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../conrollers/login_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends StateMVC<Login> {
  late LoginController loginController;

  _LoginState() : super(LoginController()) {
    loginController = controller as LoginController;
  }

  // @override
  // void initState() {
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "id",
                ),
                onChanged: (id) => loginController.setId(id),
              ),
              ElevatedButton(
                  onPressed: () {
                    loginController.getData();
                  },
                  child: Text("Get Data")),
            ],
          ),
        ),
      ),
    );
  }
}
