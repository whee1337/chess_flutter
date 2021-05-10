import 'package:chessopfirst/chessUtils/chessgame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../chessUtils/chessCache.dart';
import '../chessUtils/chessCustomController.dart';

import 'package:flutter_chess_board/flutter_chess_board.dart';

class PlayScreen extends StatelessWidget {
  ChessCustomController _controller;
  ChessGame _game;
  int turnNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChessCache>(builder: (context, cache, _) {
      final item = cache.list[cache.index];
      _controller = ChessCustomController(item, cache.playingAsWhite);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.performFristMove();
      });
      _game = item;
      print("consumer called");
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(item.name),
          ),
          body: ChessBoard(
            chessBoardController: _controller,
            onMove: (move) {
              _controller.performNextMove();
            },
            onCheck: (color) {
              print(color);
            },
            onCheckMate: (color) {
              print(color);
            },
            onDraw: () {},
            size: MediaQuery.of(context).size.width,
            enableUserMoves: true,
            boardType: BoardType.green,
          ));
    });
  }
}
