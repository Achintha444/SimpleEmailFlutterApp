import 'package:flutter/material.dart';

import 'Constants/Layout/InputTextField.dart';
import 'Constants/StaticContants.dart';
import 'Objects/User.dart';

class PasswordChangeInterface extends StatelessWidget {
  Function _loginTemp;
  TextEditingController _passwordController;

  PasswordChangeInterface({
    @required Function login,
    @required TextEditingController passwordController,
  }) {
    this._loginTemp = login;
    this._passwordController = passwordController;
  }

  _login(BuildContext tempContext) {
    if (_passwordController.text == "" || _passwordController.text == null) {
      return showDialog(
        context: tempContext,
        child: new AlertDialog(
          title: new Text("Field is Empty!"),
          content: new Text("Password cannot be empty!"),
          backgroundColor: Color.fromARGB(220, 117, 218, 255),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              textColor: StaticContants.secondaryDarkerColor,
              onPressed: () {
                Navigator.of(tempContext).pop(false);
              },
            ),
          ],
        ),
      );
    } else {
      User.getInstance.setPassword = _passwordController.text;
      //_passwordController.text = "";
      this._loginTemp(tempContext);
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return new Center(
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
              helperText: "Enter your accounts password",
            ),
          ),
          new Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: _width / 15, right: _width / 15, top: _height / 20),
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
              onPressed: () {
                _login(context);
              },
              color: StaticContants.mainColor,
              padding: EdgeInsets.only(
                top: _height / 80,
                bottom: _height / 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
