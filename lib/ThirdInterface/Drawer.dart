import 'package:email_flutter_app/Constants/PageTransistions/SlideLeftRoute.dart';
import 'package:email_flutter_app/Constants/StaticContants.dart';
import 'package:email_flutter_app/Objects/User.dart';
import 'package:flutter/material.dart';

import '../main.dart';

@protected
class DrawerOf extends StatelessWidget {
  void _logout(BuildContext tempContext) {
    User.signOut();
    Navigator.push(
      tempContext,
      SlideLeftRoute(
        page: FirstInterface(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return new Drawer(
      child: Container(
        padding: EdgeInsets.only(top: _height / 20),
        child: new Column(
          children: <Widget>[
            new Container(
              width: _height / 8,
              height: _height / 8,
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
            new Container(
              margin: EdgeInsets.only(
                top: _height / 30,
              ),
              child: new Text(
                User.getInstance.getDisplayName,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    color: StaticContants.mainColor,
                    fontSize: _height / 20,
                    letterSpacing: 2,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(
                top: _height / 30,
              ),
              child: new Text(
                User.getInstance.getEmail,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    color: StaticContants.mainColor,
                    fontSize: _height / 35,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
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
                        "LOGOUT",
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
                  _logout(context);
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
      ),
    );
  }
}
