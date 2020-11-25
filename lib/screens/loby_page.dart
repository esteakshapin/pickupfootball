import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../Player.dart';

class LobyPage extends StatefulWidget {
  Player _admin;
  List<Player> players = new List<Player>();
  @override
  _LobyPageState createState() => _LobyPageState();

  LobyPage(Player admin){
    _admin = admin;
    players.add(admin);
  }
}

class _LobyPageState extends State<LobyPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
