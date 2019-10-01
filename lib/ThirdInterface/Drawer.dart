import 'package:email_flutter_app/Objects/User.dart';
import 'package:flutter/material.dart';

@protected
class DrawerOf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return new Drawer(
      child: Container(
        padding: EdgeInsets.only(top: _height/20),
        child: new Column(
          children: <Widget>[
            new Container(
              width: _height/8,
              height:_height/8,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                    User.getInstance.getPhotoUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
