import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pickupfootball/entry_points/main.dart';
import 'package:pickupfootball/screens/lobby_page/lobby_page.dart';
import 'package:pickupfootball/settings.dart';

import '../Player.dart';

class CreateGameSettings extends StatefulWidget {
  static const SizedBox defualt_height_spacer = SizedBox(height: 20);

  @override
  _CreateGameSettingsState createState() => _CreateGameSettingsState();
}

class _CreateGameSettingsState extends State<CreateGameSettings> {
  String _position_value, _qb_playing_offense_defense;
  int _rotate_aft_drive, _score_amt;
  final name_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void handle_position(String value) {
    setState(() {
      _position_value = value;
    });
  }

  void handle_qb_offense_defense(String value) {
    setState(() {
      _qb_playing_offense_defense = value;
    });
  }

  void handle_rotate_drive(int value) {
    setState(() {
      _rotate_aft_drive = value;
    });
  }

  void handle_score(int value) {
    setState(() {
      _score_amt = value;
    });
  }

  bool handle_next() {
    if (_score_amt != null &&
        _rotate_aft_drive != null &&
        _qb_playing_offense_defense != null &&
        _position_value != null &&
        name_controller.text != "") {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return OKToast(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Game"),
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text("Name"),
                  CreateGameSettings.defualt_height_spacer,
                  TextField(
                    controller: name_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Your Name'),
                  ),
                  CreateGameSettings.defualt_height_spacer,
                  Text("Position"),
                  CreateGameSettings.defualt_height_spacer,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: Player.WR,
                        groupValue: _position_value,
                        onChanged: handle_position,
                      ),
                      Text("WR"),
                      Radio(
                        value: Player.QB,
                        groupValue: _position_value,
                        onChanged: handle_position,
                      ),
                      Text("QB"),
                      Radio(
                        value: Player.RB,
                        groupValue: _position_value,
                        onChanged: handle_position,
                      ),
                      Text("RB")
                    ],
                  ),
                  CreateGameSettings.defualt_height_spacer,
                  Text("QB playing offense and Defense?"),
                  CreateGameSettings.defualt_height_spacer,
                  Row(
                    children: [
                      Radio(
                        value: "Yes",
                        groupValue: _qb_playing_offense_defense,
                        onChanged: handle_qb_offense_defense,
                      ),
                      Text("Yes"),
                      Radio(
                        value: "No",
                        groupValue: _qb_playing_offense_defense,
                        onChanged: handle_qb_offense_defense,
                      ),
                      Text("No"),
                    ],
                  ),
                  CreateGameSettings.defualt_height_spacer,
                  Text("Rotate after how many drives?"),
                  CreateGameSettings.defualt_height_spacer,
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _rotate_aft_drive,
                        onChanged: handle_rotate_drive,
                      ),
                      Text("One"),
                      Radio(
                        value: 2,
                        groupValue: _rotate_aft_drive,
                        onChanged: handle_rotate_drive,
                      ),
                      Text("Two"),
                      Radio(
                        value: 3,
                        groupValue: _rotate_aft_drive,
                        onChanged: handle_rotate_drive,
                      ),
                      Text("Three"),
                    ],
                  ),
                  CreateGameSettings.defualt_height_spacer,
                  Text("Score Point Amount?"),
                  CreateGameSettings.defualt_height_spacer,
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _score_amt,
                        onChanged: handle_score,
                      ),
                      Text("One Point"),
                      Radio(
                        value: 2,
                        groupValue: _score_amt,
                        onChanged: handle_score,
                      ),
                      Text("Two Point"),
                      Radio(
                        value: 7,
                        groupValue: _score_amt,
                        onChanged: handle_score,
                      ),
                      Text("Seven Point"),
                    ],
                  ),
                  CreateGameSettings.defualt_height_spacer,
                  Row(
                    children: [
                      Expanded(
                          child: new RaisedButton(
                        onPressed: () => {
                          if (handle_next())
                            {
                              Navigator.of(context).pop(),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LobbyPage(
                                          Player(_position_value,
                                              name_controller.text, admin: true),
                                          Settings(_qb_playing_offense_defense,
                                              _rotate_aft_drive, _score_amt))))
                            }
                          else
                            {
                              setState(() {
                                showToast(
                                  " Please fill in all the form fields!! ",
                                  position: ToastPosition.center,
                                );
                              })
                            }
                        },
                        child: new Text(
                          'Next',
                          style: new TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        color: Theme.of(context).accentColor,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
