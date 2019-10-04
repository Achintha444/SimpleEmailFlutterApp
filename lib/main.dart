import 'package:email_flutter_app/Constants/Layout/BaseAlertDialog.dart';
import 'package:email_flutter_app/Constants/Layout/BaseAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Constants/Layout/PreLoader/ModelRoundedProgressBar.dart';
import 'Constants/Layout/PreLoader/ProgressBarHandler.dart';
import 'Constants/StaticContants.dart';
import 'Constants/PageTransistions/SlideRightRoute.dart';

import 'Objects/User.dart';

import 'SecondInterface.dart';

void main() => runApp(
      new MaterialApp(
        home: FirstInterface(),
      ),
    );

class FirstInterface extends StatelessWidget {
  User user;
  ProgressBarHandler _handler;

  void _login(BuildContext tempContext) async {
    _handler.show();
    user = (await User.signIn());
    Navigator.push(
      tempContext,
      SlideRightRoute(
        page: SecondInterface(),
      ),
    );
    _handler.dismiss();
  }

  Future<bool> _exitApp(BuildContext context) {
  return showDialog(
        context: context,
        child: new BaseAlertDialog(
          title: "Do you want to exit FAST Email?",
          content: "Are you sure?",
          yes: "YES",
          yesOnPressed: () => SystemNavigator.pop(),
          no: "NO",
          noOnPressed: ()=> Navigator.of(context).pop(false),
        ),
        // child: new AlertDialog(
        //   title: new Text('Do you want to exit this application?'),
        //   content: new Text('We hate to see you leave...'),
        //   actions: <Widget>[
        //     new FlatButton(
        //       onPressed: () => Navigator.of(context).pop(false),
        //       child: new Text('No'),
        //     ),
        //     new FlatButton(
        //       onPressed: () => SystemNavigator.pop(),
        //       child: new Text('Yes'),
        //     ),
        //   ],
        // ),
      ) ??
      false;
}

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    ;
    ModalRoundedProgressBar _progressBar = ModalRoundedProgressBar(
      //getting the handler
      handleCallback: (handler) {
        _handler = handler;
      },
    );
    WillPopScope _willPopScope = new WillPopScope(
      onWillPop: ()=>_exitApp(context),
      child: new Scaffold(
        body: new Container(
          //padding: EdgeInsets.only(top: _height / 18),
          color: StaticContants.backgroundColor,
          alignment: Alignment.center,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: AssetImage("assets/images/emailIcon.jpg"),
                height: _height / 3,
              ),
              new Container(
                padding: EdgeInsets.only(top: _height / 30),
                child: new Text(
                  "Fast EMAIL",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: StaticContants.mainColor,
                      fontSize: _height / 10,
                      letterSpacing: 2,
                      wordSpacing: 3,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic),
                ),
              ),
              new Container(
                padding: EdgeInsets.only(
                  top: _height / 30,
                  bottom: _height / 30,
                ),
                child: new Text(
                  "~ Email Sending APP ~",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: StaticContants.mainColor,
                    fontSize: _height / 30,
                    letterSpacing: 1.5,
                    wordSpacing: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              new Container(
                padding: EdgeInsets.only(
                  left: _width / 10,
                  right: _width / 10,
                ),
                child: new RaisedButton(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Image(
                        image: AssetImage(
                            StaticContants.imagesLocation + "googleLogo.jpg"),
                        height: _height / 15,
                      ),
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
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        _willPopScope,
        _progressBar,
      ],
    );
  }
}
