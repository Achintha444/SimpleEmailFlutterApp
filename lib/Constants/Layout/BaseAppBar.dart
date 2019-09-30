import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.blue;
  final Text title;
  static final AppBar appBar = new AppBar();
  final List<Widget> widgets;
  
  const BaseAppBar({Key key, this.title,this.widgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
