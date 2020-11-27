import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pickupfootball/screens/lobby_page/lobby_page.dart';
import 'package:pickupfootball/settings.dart';

import '../Player.dart';

class CreateGameSettings extends StatefulWidget {
  static const SizedBox default_height_spacer = SizedBox(height: 20);

  @override
  _CreateGameSettingsState createState() => _CreateGameSettingsState();
}

class _CreateGameSettingsState extends State<CreateGameSettings> {
  // ignore: non_constant_identifier_names
  String _position_value;

  // ignore: non_constant_identifier_names
  int _rotate_aft_drive, _score_amt;

  // ignore: non_constant_identifier_names
  bool _possession, _qb_playing_offense_defense;

  // ignore: non_constant_identifier_names
  final name_controller = TextEditingController();

  // ignore: non_constant_identifier_names
  final player_on_field_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // ignore: non_constant_identifier_names
  void handle_position(String value) {
    setState(() {
      _position_value = value;
    });
  }

  // ignore: non_constant_identifier_names
  void handle_possesion(bool value) {
    setState(() {
      _possession = value;
    });
  }

  // ignore: non_constant_identifier_names
  void handle_qb_offense_defense(bool value) {
    setState(() {
      _qb_playing_offense_defense = value;
    });
  }

  // ignore: non_constant_identifier_names
  void handle_rotate_drive(int value) {
    setState(() {
      _rotate_aft_drive = value;
    });
  }

  // ignore: non_constant_identifier_names
  void handle_score(int value) {
    setState(() {
      _score_amt = value;
    });
  }

  // ignore: non_constant_identifier_names
  bool handle_next() {
    if (_score_amt != null &&
        _rotate_aft_drive != null &&
        _qb_playing_offense_defense != null &&
        _position_value != null &&
        _possession != null &&
        name_controller.text != "" &&
        player_on_field_controller.text != "") {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name_controller.dispose();
    player_on_field_controller.dispose();
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
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Container(
                // color: Colors.green,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text("Name"),
                      CreateGameSettings.default_height_spacer,
                      TextField(
                        controller: name_controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Your Name'),
                      ),
                      CreateGameSettings.default_height_spacer,
                      Text("Position"),
                      CreateGameSettings.default_height_spacer,
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
                      CreateGameSettings.default_height_spacer,
                      Text("QB playing offense and Defense?"),
                      CreateGameSettings.default_height_spacer,
                      Row(
                        children: [
                          Radio(
                            value: true,
                            groupValue: _qb_playing_offense_defense,
                            onChanged: handle_qb_offense_defense,
                          ),
                          Text("Yes"),
                          Radio(
                            value: false,
                            groupValue: _qb_playing_offense_defense,
                            onChanged: handle_qb_offense_defense,
                          ),
                          Text("No"),
                        ],
                      ),
                      CreateGameSettings.default_height_spacer,
                      Text("Rotate after how many drives?"),
                      CreateGameSettings.default_height_spacer,
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
                      CreateGameSettings.default_height_spacer,
                      Text("Score Point Amount?"),
                      CreateGameSettings.default_height_spacer,
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
                      CreateGameSettings.default_height_spacer,
                      Text("Are You Starting On Offense?"),
                      CreateGameSettings.default_height_spacer,
                      Row(
                        children: [
                          Radio(
                            value: true,
                            groupValue: _possession,
                            onChanged: handle_possesion,
                          ),
                          Text("Yes"),
                          Radio(
                            value: false,
                            groupValue: _possession,
                            onChanged: handle_possesion,
                          ),
                          Text("No"),
                        ],
                      ),
                      CreateGameSettings.default_height_spacer,
                      Text("Players On the Field"),
                      CreateGameSettings.default_height_spacer,
                      TextField(
                        controller: player_on_field_controller,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:
                                '# of Players playing on the Field'),
                      ),
                      CreateGameSettings.default_height_spacer,
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
                                              Player(name_controller.text,
                                                  _position_value, true),
                                              Settings(
                                                  _qb_playing_offense_defense,
                                                  _rotate_aft_drive,
                                                  _score_amt,
                                                  _possession, int.parse(player_on_field_controller.text)))))
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

                      ),
                      CreateGameSettings.default_height_spacer,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
