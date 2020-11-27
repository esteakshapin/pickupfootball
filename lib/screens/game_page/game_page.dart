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
  bool _possession;

  Queue<Player> _on_field_players;
  Queue<Player> _on_bench_players;

  List<Player> _full_roster = new List<Player>();
  Player _qb;

  // number of players that will be rotated next
  int num_of_rotation;

  Player removeBenchPlayer() {
    return _on_bench_players.removeFirst();
  }

  void addBenchPlayer(List<Player> p) {
    for (Player player in p) {
      if (player.position == Player.QB) {
        _on_bench_players.addFirst(player);
      } else {
        _on_bench_players.add(player);
      }
    }
  }

  Player removeOnFieldPlayer() {
    return _on_field_players.removeFirst();
  }

  void addOnFieldPlayer(List<Player> p) {
    for (Player player in p) {
      if (player.position == Player.QB) {
        _on_field_players.addFirst(player);
      } else {
        _on_field_players.add(player);
      }
    }
  }

  void offensiveTransition() {
    List<Player> temp_p = new List<Player>();
    List<Player> temp_d_p = new List<Player>();

    // removing players from the bench
    for(int i = 0; i < num_of_rotation; i++){
      temp_p.add(removeBenchPlayer());
    }

    //removing players from on Field (currently playing defense)
    for(int i = 0; i < num_of_rotation; i++){
      temp_d_p.add(removeOnFieldPlayer());
    }

    //adding players going from bench to field
    addOnFieldPlayer(temp_p);

    //adding players going from field to bench
    addBenchPlayer(temp_d_p);
  }

  void defensiveTransition() {
    List<Player> temp_p = new List<Player>();
    List<Player> temp_b_p = new List<Player>();

    //removing players from field
    for(int i = 0; i < num_of_rotation; i++){
      temp_p.add(removeOnFieldPlayer());
    }

    // removing bench player
    for(int i = 0; i < num_of_rotation; i++){
      temp_b_p.add(removeBenchPlayer());
    }

    //adding players going from field to bench
    addBenchPlayer(temp_p);

    //adding players going from bench to field
    addOnFieldPlayer(temp_b_p);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _players = widget.players;
    _settings = widget._settings;
    num_of_rotation = _settings.rotate_num_of_people;
    _full_roster = _players.sublist(0);
    for (Player player in _players) {
      if (player.position == "QB") _qb = player;
      _players.remove(_qb);
    }
    print(_qb.name);
    _players = _shuffle_players(_players);
    _on_field_players = new Queue<Player>.from(
        _players.sublist(0, _settings.num_of_players_on_field));
    _on_bench_players = new Queue<Player>.from(
        _players.sublist(_settings.num_of_players_on_field));

    _possession = _settings.starting_possesion;

    _on_bench_players.addFirst(_qb);

    print(" --- full Roster --- ");
    for (Player p in _full_roster) print(p.name);
    print(_full_roster.length);
    print("");

    print(" --- on field players ---");
    for (Player p in _on_field_players) print(p.name);
    print(_on_field_players.length);
    print("");

    print(" --- on bench players ---");
    for (Player p in _on_bench_players) print(p.name);
    print(_on_bench_players.length);
    print("");

    if (_possession) {
      setState(() {
        offensiveTransition();
      });
    }
  }

  List<Player> _shuffle_players(List<Player> items) {
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

  void endDrive() {
    setState(() {
      _possession = !_possession;
      if (_possession) {
        offensiveTransition();
      } else {
        defensiveTransition();
      }
    });
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
                padding: kIsWeb
                    ? EdgeInsets.fromLTRB(40, 10, 40, 30)
                    : EdgeInsets.all(20),
                child: Column(
                  children: [
                    ScoreBoard(endDrive, _possession),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: [
                        OnField(
                          _on_field_players.toList(),
                          "On Field",
                          Settings.lightGreen,
                          qbTileColor: Settings.cream,
                          rotationTileColor: Settings.slateGray,
                          num_of_rotation: num_of_rotation,
                          tile_icon: Icons.exit_to_app_sharp,
                        ),
                        OnField(
                          _on_bench_players.toList(),
                          "On Bench",
                          Settings.lightRed,
                          qbTileColor: Settings.cream,
                          rotationTileColor: Settings.slateGray,
                          num_of_rotation: num_of_rotation,
                          tile_icon: null,
                        ),
                        OnField(_full_roster, "Roster", Settings.lightBlue)
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
