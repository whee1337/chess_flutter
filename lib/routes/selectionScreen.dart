import 'package:chessopfirst/routes.dart';
import 'package:chessopfirst/chessUtils/chessCache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectScreenState();
  }
}

class _SelectScreenState extends State<SelectionScreen> {
  bool _playingAsWhite = true;

  void changeState() {
    setState(() {
      _playingAsWhite = !_playingAsWhite;
    });
  }

  Icon geticon() {
    if (_playingAsWhite) {
      return const Icon(Icons.sports_esports_outlined);
    } else {
      return const Icon(
        Icons.sports_esports,
        color: Colors.black,
      );
    }
  }

  void _open(context) {
    Navigator.of(context).pushNamed(RouteGenerator.start);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Choose your opening"),
        actions: [
          IconButton(
            icon: geticon(),
            tooltip: 'Playing as ',
            onPressed: () {
              changeState();
            },
          ),
        ],
      ),
      body: Consumer<ChessCache>(builder: (context, cache, _) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: ElevatedButton(
                  onPressed: () {
                    cache.index = index;
                    cache.playingAsWhite = _playingAsWhite;
                    _open(this.context);
                  },
                  child: Text(cache.list[index].name)),
            );
          },
          itemCount: cache.list.length,
        );
      }),
    );
  }
}
