import 'package:email_flutter_app/Constants/Layout/PreLoader/ProgressBarHandler.dart';
import 'package:flutter/material.dart';

class ModalRoundedProgressBar extends StatefulWidget {
  final double _opacity;
  final String _textMessage;
  final Function
      _handlerCallback;

  ModalRoundedProgressBar({
    @required Function handleCallback(ProgressBarHandler handler),
    String message = "",
    double opacity = 0.8,
  })  : _textMessage = message,
        _opacity = opacity,
        _handlerCallback = handleCallback;

  @override
  State createState() => _ModalRoundedProgressBarState();
}

class _ModalRoundedProgressBarState extends State<ModalRoundedProgressBar> {
  bool _isShowing =
      false; 
  @override
  void initState() {
    super.initState();
    ProgressBarHandler handler = ProgressBarHandler();

    handler.show = this.show;
    handler.dismiss =
        this.dismiss; 
    widget._handlerCallback(handler);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isShowing) return Stack();
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: widget._opacity,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black87,
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  
                ),
                Text(widget._textMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void show() {
    setState(() => _isShowing = true);
  }

  void dismiss() {
    setState(() => _isShowing = false);
  }
}