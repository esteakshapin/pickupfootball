import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pickupfootball/screens/game_page/stop_watch.dart';

import '../../settings.dart';
import 'ScoreWidget.dart';

class ScoreBoard extends StatefulWidget {
  Function _endDrive;
  bool _possession;
  int home_score, away_score;

  ScoreBoard(this._endDrive, this._possession, this.home_score, this.away_score);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  int hours = 0, min = 0, sec = 0;

  // ignore: cancel_subscriptions
  StreamSubscription<int> timerSubscription;
  Stream<int> timerStream;

  String getTime() {
    String _hours = hours.toString();
    String _min = min.toString();
    String _sec = sec.toString();

    if (hours < 10) {
      _hours = "0" + hours.toString();
    }
    if (min < 10) {
      _min = "0" + min.toString();
    }
    if (sec < 10) {
      _sec = "0" + sec.toString();
    }

    return _hours + ":" + _min + ":" + _sec;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(hours);
    timerStream = StopWatch.stopWatchStream();
    timerSubscription = timerStream.listen((int newTick) {
      setState(() {
        hours = ((newTick / (60 * 60)) % 60).floor();
        min = ((newTick / 60) % 60).floor();
        sec = (newTick % 60).floor();
      });
    });
  }

  @override
  void dispose() {
    timerSubscription.cancel();
    timerStream = null;

    hours = 0;
    min = 0;
    sec = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 3),
                ),
                child: Text(
                  getTime(),
                  style: GoogleFonts.kanit(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScoreWidget("HOME", widget.home_score.toString(), widget._possession),
              ScoreWidget("AWAY", widget.away_score.toString(), !widget._possession),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text("End Drive"),
                onPressed: () => widget._endDrive(),
              ),
              RaisedButton(
                child: Text("End Game"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          )
        ],
      ),
    );
  }
}
