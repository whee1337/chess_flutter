import 'package:chessopfirst/chessUtils/chessmove.dart';
import 'chessmove.dart';

class ChessGame {
  String _name;
  List<ChessMove> _moveSet;

  ChessGame(this._name, this._moveSet);

  factory ChessGame.ofJson(Map<String, dynamic> json) {
    List<dynamic> list = json["moveSet"];

    List<ChessMove> moveSet =
        list.map((move) => ChessMove.fromJson(move)).toList();

    return ChessGame(json["name"], moveSet);
  }

  List<ChessMove> get moveSet => _moveSet;
  String get name => _name;
}
