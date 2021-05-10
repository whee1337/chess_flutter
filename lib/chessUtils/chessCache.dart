import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'chessgame.dart';
import 'package:flutter/services.dart' show rootBundle;

class ChessCache with ChangeNotifier {
  List<ChessGame> _list = [];
  int _index = -1;

  bool _playingAsWhite = true;

  ChessCache() {
    createList();
  }

  void set playingAsWhite(bool value) => _playingAsWhite = value;
  bool get playingAsWhite => _playingAsWhite;

  int get index => _index;

  set index(int value) {
    if (value >= 0 && value <= _list.length) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<ChessGame> get list =>
      UnmodifiableListView<ChessGame>(_list);

  void createList() async {
    var json = await rootBundle.loadString("myassets/chessGames.json");

    var games = jsonDecode(json);

    List<dynamic> chessGames = games["games"];

    print(chessGames.runtimeType);

    List<ChessGame> list =
        chessGames.map((json) => ChessGame.ofJson(json)).toList();

    print(list.length);

    _list = list;

    notifyListeners();
  }

  String get choosenGame {
    var index = this._index;

    if (index < 0 || index >= this._list.length) {
      return "No Game choosen!";
    }

    return _list[index].name;
  }
}
