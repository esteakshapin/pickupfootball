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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _players = widget.players;
    _settings = widget._settings;
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
