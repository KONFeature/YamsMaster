import 'package:flutter/material.dart';

class UIConstants {
  static TextStyle titleStyle(context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 32.0,
      fontWeight: FontWeight.w300,
      letterSpacing: 2.0);

  static TextStyle mainInfosStyle(context) => TextStyle(
      color: Theme.of(context).accentColor,
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.8);

  static const TextStyle buttonStyle =
  TextStyle(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 1.2);

  static const TextStyle largeTextStyle =
  TextStyle(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 1.2);

  static const EdgeInsetsGeometry smallPadding = EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0);
  static const EdgeInsetsGeometry mediumPadding = EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
  static const EdgeInsetsGeometry largeVPadding = EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0);
}

class Strings {

}
