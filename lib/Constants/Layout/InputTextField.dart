import 'package:flutter/material.dart';

import 'package:email_flutter_app/Constants/StaticContants.dart';

class InputTextField extends StatelessWidget {
  TextEditingController _controller;
  bool _obscure;
  String _labelText;
  Icon _icon;
  Color _borederColor = StaticContants.secondaryDarkerColor;
  InputTextField(
      {TextEditingController controller,
      bool obscure,
      String labelText,
      Icon icon = null}) {
    this._controller = controller;
    this._obscure = obscure;
    this._labelText = labelText;
    this._icon = icon;
  }

  @override
  Widget build(BuildContext context) {
    return new TextField(
      controller: this._controller,
      cursorColor: StaticContants.secondaryDarkerColor,
      decoration: new InputDecoration(
          focusColor: StaticContants.secondaryDarkerColor,
          hoverColor: StaticContants.secondaryLighterColor,
          fillColor: StaticContants.secondaryDarkerColor,
          helperText: "Enter your emails password",
          //icon: this._icon,
          prefixIcon: this._icon,
          //hintText: "Enter the password",
          labelText: this._labelText,
          //alignLabelWithHint: true,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25),
            borderSide: new BorderSide(
              color: StaticContants.secondaryDarkerColor,
            ),
            gapPadding: 5,
          )),
      textAlign: TextAlign.left,
      obscureText: this._obscure,
    );
  }
}
