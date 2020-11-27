import 'package:flutter/material.dart';
import 'package:pickupfootball/screens/lobby_page/lobby_page.dart';
import 'package:pickupfootball/settings.dart';

import '../Player.dart';

void main() {
  runApp(LobbyPageEntry());
}

// Entry Point to Lobby Page
class LobbyPageEntry extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick Up Football',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LobbyPage(Player("John Joe", "QB", true), Settings(true, 1, 1, true, 6)),
    );
  }
}