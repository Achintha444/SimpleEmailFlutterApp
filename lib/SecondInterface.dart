import 'package:flutter/material.dart';

import 'Constants/StaticContants.dart';
import 'Constants/Layout/InputTextField.dart';
import 'Constants/PageTransistions/SlideRightRoute.dart';

import 'Objects/User.dart';

import 'ThirdInterface/ThirdInterface.dart';
import './PasswordChangeInterface.dart';

class SecondInterface extends StatefulWidget {
  @override
  _SecondInterfaceState createState() => _SecondInterfaceState();
}

class _SecondInterfaceState extends State<SecondInterface> {
  TextEditingController _passwordController = new TextEditingController();
  void _login(BuildContext tempContext) {
    Navigator.push(
      tempContext,
      SlideRightRoute(
        page: ThirdInterface(),
      ),
    );
    print(User.getInstance.getPassword);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return new Scaffold(
      backgroundColor: StaticContants.backgroundColor,
      body: new PasswordChangeInterface(
        login: _login,
        passwordController: _passwordController,
      ),
    );
  }
}
