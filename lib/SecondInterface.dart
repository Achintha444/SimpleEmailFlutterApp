import 'package:flutter/material.dart';

import 'Constants/StaticContants.dart';
import 'Constants/Layout/InputTextField.dart';
import 'Constants/PageTransistions/SlideRightRoute.dart';

import 'Objects/User.dart';

import './ThirdInterface.dart';

class SecondInterface extends StatefulWidget {
  @override
  _SecondInterfaceState createState() => _SecondInterfaceState();
}

class _SecondInterfaceState extends State<SecondInterface> {
  TextEditingController _passwordController = new TextEditingController();

  void _login(BuildContext tempContext){
    User.getInstance.setPassword = _passwordController.text;
    _passwordController.text = "";
    Navigator.push(
      tempContext,
      SlideRightRoute(
        page: ThirdInterface(),
      ),
    );
    print (User.getInstance.getPassword);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return new Scaffold(
      backgroundColor: StaticContants.backgroundColor,
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(
                left: _width / 20,
                right: _width / 20,
              ),
              child: new InputTextField(
                controller: _passwordController,
                icon: Icon(Icons.lock),
                labelText: "Enter the Password",
                obscure: true,
              ),
            ),
            new Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                left: _width / 15,
                right: _width / 15,
                top: _height/20
              ),
              child: new RaisedButton(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(left: _width / 25),
                      child: new Text(
                        "LOGIN",
                        style: new TextStyle(
                          color: StaticContants.backgroundColor,
                          fontSize: _height / 30,
                          letterSpacing: 1.5,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {_login(context);},
                color: StaticContants.mainColor,
                padding: EdgeInsets.only(
                  top: _height / 80,
                  bottom: _height / 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
