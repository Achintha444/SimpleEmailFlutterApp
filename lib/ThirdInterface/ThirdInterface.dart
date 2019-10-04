import 'package:email_flutter_app/Constants/StaticContants.dart';
import 'package:email_flutter_app/PasswordChangeInterface.dart';
import 'package:email_flutter_app/ThirdInterface/BodyOf.dart';
import 'package:email_flutter_app/ThirdInterface/Drawer.dart';
import 'package:email_flutter_app/ThirdInterface/EmailOf.dart';
import 'package:flutter/material.dart';

class ThirdInterface extends StatefulWidget {
  @override
  _ThirdInterdfaceState createState() => _ThirdInterdfaceState();
}

class _ThirdInterdfaceState extends State<ThirdInterface> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _login(BuildContext tempContext) {
    print("adsda");
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        key: _scaffoldKey,
        //resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          backgroundColor: StaticContants.mainColor,
          automaticallyImplyLeading: false,
          title: new Container(
            child: new Row(
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.view_list,
                    color: StaticContants.backgroundColor,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                new Container(
                  padding: EdgeInsets.only(top: _height / 90),
                  child: new Container(
                    margin: EdgeInsets.only(left: _width / 40),
                    child: new Text(
                      "Fast EMAIL",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          color: StaticContants.backgroundColor,
                          fontSize: _height / 30,
                          letterSpacing: 2,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: new TabBar(
            isScrollable: true,
            tabs: <Widget>[
              new Container(
                width: _width / 2,
                child: new Tab(
                  text: "Send Email",
                  icon: Icon(Icons.email),
                ),
              ),
              new Container(
                width: _width / 2,
                child: new Tab(
                  text: "Change Password",
                  icon: Icon(Icons.lock),
                ),
              ),
            ],
          ),
        ),
        drawer: new DrawerOf(),
        body: new TabBarView(
          children: <Widget>[
            //new EmailOf(),
            new EmailOf(),
            new PasswordChangeInterface(
              login: _login,
            ),
          ],
        ),
      ),
    );
  }
}
