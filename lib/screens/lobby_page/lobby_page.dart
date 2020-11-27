import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pickupfootball/screens/game_page/game_page.dart';
import 'package:pickupfootball/screens/lobby_page/lobby_info.dart';
import 'package:pickupfootball/screens/lobby_page/roster_widget.dart';

import '../../Player.dart';
import '../../settings.dart';

class LobbyPage extends StatefulWidget {
  Player _admin;
  List<Player> players = new List<Player>();
  Settings _settings;

  @override
  _LobbyPageState createState() => _LobbyPageState();

  LobbyPage(Player admin, Settings settings) {
    _admin = admin;
    players.add(admin);
    _settings = settings;
  }
}

class _LobbyPageState extends State<LobbyPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.players);
    print(widget.players[0].admin);
  }

  void addPlayers(Player p) {
    setState(() {
      widget.players.add(p);
      print(
          "added: " + p.name + " / " + p.position + " / " + p.admin.toString());
    });
  }

  void removePlayer(Player p) {
    setState(() {
      widget.players.remove(p);
      print("removed: " +
          p.name +
          " / " +
          p.position +
          " / " +
          p.admin.toString());
    });
  }

  bool _one_qb_check(){
    int counter = 0;
    for(Player player in widget.players){
      if(player.position == Player.QB) counter++;
    }
    if(counter > 1) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Game Lobby"),
          actions: [Icon(Icons.settings)],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LobbyInfo("1552323", addPlayers),
                SizedBox(
                  height: 20,
                ),
                RosterWidget(widget.players, removePlayer),
                RaisedButton(
                  child: Text("Start Game"),
                  onPressed: () {
                    print('pressed start game');
                    if (widget.players.length >=
                        widget._settings.num_of_players_on_field && _one_qb_check()) {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GamePage(widget.players, widget._settings)));
                    } else {
                      setState(() {
                        showToast(
                          " Please make sure to have at least " +
                              widget._settings.num_of_players_on_field
                                  .toString() +
                              " players and at most one QB",
                          position: ToastPosition.center,
                        );
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
