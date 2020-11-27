import 'package:flutter/material.dart';
import 'package:pickupfootball/player_card.dart';

import '../../Player.dart';
import '../../settings.dart';

class OnField extends StatelessWidget {
  List<Player> on_field = new List<Player>();
  String _title;
  Color _tile_color;

  OnField(this.on_field, this._title, this._tile_color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      constraints: BoxConstraints(
        maxWidth: 300,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                  "Number of players: " +
                      on_field.length.toString()
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                for (var p in on_field)
                  PlayerCard(
                    p,
                    (Player p) {
                      print(p.name);
                    },
                    tile_color: _tile_color,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
