import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
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

  LobbyPage(Player admin, Settings settings){
    _admin = admin;
    _admin.admin = true;
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

  void addPlayers(Player p){
    setState(() {
      widget.players.add(p);
      print(widget.players[0].position + " / " + widget.players[0].admin.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Game Lobby"
          ),
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
                SizedBox(height: 20,),
                RosterWidget(widget.players)
              ],
            ),

          ),
        ),
      ),
    );
  }
}
