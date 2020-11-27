import 'package:flutter/material.dart';
import 'package:pickupfootball/player_card.dart';

import '../../Player.dart';
import '../../settings.dart';

class OnField extends StatelessWidget {
  List<Player> on_field = new List<Player>();
  String _title;
  Color _tile_color, rotationTileColor, qbTileColor;
  int num_of_rotation;
  IconData tile_icon;

  OnField(this.on_field, this._title, this._tile_color, {this.rotationTileColor, this.qbTileColor, this.num_of_rotation = 0, this.tile_icon = Icons.delete_forever_sharp});

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
                  (p.position == Player.QB && qbTileColor != null) ?
                  PlayerCard(
                    p,
                    (Player p) {
                      print(p.name);
                    },
                    tile_color: qbTileColor,
                    tile_icon: tile_icon,
                  ) : (on_field.indexOf(p) < num_of_rotation && rotationTileColor != null) ? PlayerCard(
                    p,
                        (Player p) {
                      print(p.name);
                    },
                    tile_color: rotationTileColor,
                    tile_icon: tile_icon,
                  ) : PlayerCard(
                    p,
                        (Player p) {
                      print(p.name);
                    },
                    tile_color: _tile_color,
                    tile_icon: tile_icon,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
