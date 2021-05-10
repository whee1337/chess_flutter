import 'package:chessopfirst/chessUtils/chessCache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../chessUtils/chessCache.dart';

class ListItemOpenings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Consumer<ChessCache>(
        builder: (context, cache, _) {
          final item = cache.list[cache.index];
          return new Text("${item.name}");
        },
      )),
    );
  }
}
