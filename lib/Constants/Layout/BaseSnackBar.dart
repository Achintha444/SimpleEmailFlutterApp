import 'package:flutter/material.dart';

class BaseSnackBar extends StatelessWidget {

  Color _color = Colors.blueAccent;
  String _content;

  BaseSnackBar({String content}){
    this._content = content;
  }

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(this._content),
      backgroundColor: this._color,
    );
  }
}
