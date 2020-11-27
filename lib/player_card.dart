import 'package:flutter/material.dart';

import 'Player.dart';

class PlayerCard extends StatelessWidget {
  Player _player;
  Function _removePlayer;
  Color tile_color;

  PlayerCard(this._player, this._removePlayer, {this.tile_color = null});

  Icon leadingIcon(String position){
    switch(position){
      case "QB":
        return Icon(Icons.sports_football);
      case "WR":
        return Icon(Icons.sports_kabaddi_sharp);
      case "RB":
        return Icon(Icons.directions_run_sharp);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      child: ListTile(
        tileColor: tile_color,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leadingIcon(_player.position),
          ],
        ),
        title: Text(_player.name),
        subtitle: _player.admin
            ? Text(_player.position + " - " + "ADMIN")
            : Text(_player.position),
        trailing: (!_player.admin) ? IconButton(
          icon: Icon(Icons.delete_forever_sharp),
          onPressed: (){
            _removePlayer(_player);
          },
        ) : null,
      ),

    );
  }
}
