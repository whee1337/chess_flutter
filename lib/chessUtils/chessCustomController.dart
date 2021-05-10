import 'package:chessopfirst/chessUtils/chessgame.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class ChessCustomController extends ChessBoardController {
  ChessGame _game;
  bool _playingAsWhite;
  int _turnCount = 1;

  ChessCustomController(this._game, this._playingAsWhite);

  void performNextMove() {
    if (_turnCount > _game.moveSet.length) {
      print("Finished Moveset!");
      return;
    }
    var move = _game.moveSet[_turnCount];
    String moveAsString;

    if (_playingAsWhite) {
      moveAsString = move.moveBlack;
    } else {
      moveAsString = move.moveWhite;
    }

    makeMove(moveAsString.substring(0, 2), moveAsString.substring(2, 4));

    _turnCount++;
  }

  void performFristMove() {
    if (_playingAsWhite) {
      return;
    }

    performNextMove();
  }
}
