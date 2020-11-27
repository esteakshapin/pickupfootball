import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:pickupfootball/screens/game_page/game_page.dart';

import '../Player.dart';
import '../settings.dart';

void main() {
  runApp(GamePageEntry());
}

// Entry Point to Lobby Page
class GamePageEntry extends StatelessWidget {
  List<Player> players = new List<Player>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    players.add(Player(faker.person.name(), Player.QB, true));
    for(int i = 0; i < 8; i++){
      players.add(Player(faker.person.name(), Player.WR));
    }
    return MaterialApp(
      title: 'Pick Up Football',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage(players, Settings(true, 1, 1, true, 6)),
    );
  }
}