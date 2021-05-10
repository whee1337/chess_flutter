import 'package:chessopfirst/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chessUtils/chessCache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChessCache>(
        create: (_) => ChessCache(),
        child: MaterialApp(
          title: 'Chess Openings Training',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateTitle: (context) => "Chess Openings",
          initialRoute: RouteGenerator.root,
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
        ));
  }
}
