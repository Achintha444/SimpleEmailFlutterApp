import 'package:email_flutter_app/Constants/StaticContants.dart';
import 'package:email_flutter_app/PasswordChangeInterface.dart';
import 'package:email_flutter_app/ThirdInterface/BodyOf.dart';
import 'package:flutter/material.dart';

class ThirdInterface extends StatefulWidget {
  @override
  _ThirdInterdfaceState createState() => _ThirdInterdfaceState();
}

class _ThirdInterdfaceState extends State<ThirdInterface> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    

    void _iconButton(BuildContext tempContext) =>
        Scaffold.of(context).openDrawer();

    return new DefaultTabController(
      length: 2,
      child: new BodyOf(),
    );
  }
}
