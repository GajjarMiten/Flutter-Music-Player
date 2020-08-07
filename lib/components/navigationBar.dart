import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mantra/helpers/Theme.dart';
import 'package:mantra/providers/navigation.dart';
import 'package:provider/provider.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<NavigationData>(context);
    return CurvedNavigationBar(
      index: data.getIndex,
      items: <Widget>[
        Image.asset(
          "assets/icons/nav1.png",
          scale: 2.5,
        ),
        Image.asset(
          "assets/icons/nav2.png",
          scale: 2.5,
        ),
        Image.asset(
          "assets/icons/nav3.png",
          scale: 2.5,
        ),
        Image.asset(
          "assets/icons/nav4.png",
          scale: 2.5,
        ),
      ],
      onTap: data.setIndex,
      color: primaryColor,
      backgroundColor: backgroundColor,
      buttonBackgroundColor: backgroundColor,
      height: 60,
      animationCurve: Curves.linearToEaseOut,
      animationDuration: Duration(milliseconds: 500),
    );
  }
}
