import 'package:chessopfirst/routes/selectionScreen.dart';
import 'package:chessopfirst/routes/playScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteGenerator {
  static const String root = '/';
  static const String start = '/start';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return new MaterialPageRoute(builder: (_) => SelectionScreen());
      case start:
        return new MaterialPageRoute(builder: (_) => PlayScreen());
      default:
        throw FormatException("Route not Found");
    }
  }
}

class RouteException implements Exception {
  final String msg;

  const RouteException(this.msg);
}
