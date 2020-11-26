import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../Player.dart';

class RosterWidget extends StatelessWidget {
  List<Player> players = new List<Player>();

  RosterWidget(this.players);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Roster",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        for (var i in players) PlayerCard(i)
      ],
    );
  }
}

class PlayerCard extends StatelessWidget {
  Player _player;

  PlayerCard(this._player);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      child: ListTile(
          leading: (_player.position == Player.QB) ? Icon(Icons.sports_football) : (_player.position == Player.WR) ? Icon(Icons.sports_kabaddi_sharp) : Icon(Icons.directions_run_sharp),
          title: Text(_player.name),
          subtitle: _player.admin
              ? Text(_player.position + " - " + "ADMIN")
              : Text(_player.position)),
    );
  }
}