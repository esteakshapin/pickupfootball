import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pickupfootball/screens/game_page/score_board.dart';

import '../../Player.dart';
import '../../settings.dart';
import 'on_field.dart';

class GamePage extends StatefulWidget {
  List<Player> players = new List<Player>();
  Settings _settings;

  GamePage(this.players, this._settings);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Player> _players;
  Settings _settings;

  List<Player> _on_field_players = new List<Player>();
  List<Player> _on_bench_players = new List<Player>();
  List<Player> _full_roster = new List<Player>();
  Player _qb;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _players = widget.players;
    _settings = widget._settings;
    _full_roster = _players.sublist(0);
    for (Player player in _players) {
      if (player.position == "QB") _qb = player;
      _players.remove(_qb);
    }
    print(_qb.name);
    _players = _shuffle_players(_players);
    _on_field_players = _players.sublist(0, _settings.num_of_players_on_field);
    _on_bench_players = _players.sublist(_settings.num_of_players_on_field);

    print(" --- full Roster --- ");
    for(Player p in _full_roster) print(p.name);
    print(_full_roster.length);
    print("");

    print(" --- on field players ---");
    for(Player p in _on_field_players) print(p.name);
    print(_on_field_players.length);
    print("");

    print(" --- on bench players ---");
    for(Player p in _on_bench_players) print(p.name);
    print(_on_bench_players.length);
    print("");

  }

  List<Player> _shuffle_players(List<Player> items){
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {

      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }


  @override
  void dispose() {
    widget.players = null;
    widget._settings = null;
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Game Time"),
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                padding: kIsWeb ? EdgeInsets.fromLTRB(40, 10, 40, 30) : EdgeInsets.all(20),
                child: Column(
                  children: [
                    ScoreBoard(),
                    SizedBox(height: 20,),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: [
                        OnField(_players, "On Field", Settings.lightGreen),
                        OnField(_players, "On Bench", Settings.lightRed)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
