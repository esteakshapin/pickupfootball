import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../Player.dart';
import '../../player_card.dart';

class RosterWidget extends StatelessWidget {
  List<Player> players = new List<Player>();
  Function _removePlayer;

  RosterWidget(this.players, this._removePlayer);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Roster",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Number of players: " +
                  players.length.toString()
                )
              ],
            ),

            Expanded(
              child: ListView(
                    children: [
                      for (var i in players) PlayerCard(i, _removePlayer)
                    ],
                  ),
            )
          ],
        ),
      ),
    );
  }
}

