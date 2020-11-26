import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../../Player.dart';

class LobbyInfo extends StatefulWidget {
  String _game_code;
  Function _add_player;

  LobbyInfo(this._game_code, this._add_player);

  @override
  _LobbyInfoState createState() => _LobbyInfoState();
}

class _LobbyInfoState extends State<LobbyInfo> {
  final _name_controller = TextEditingController();
  final _game_code_controller = TextEditingController();
  String _position_value;

  @override
  void initState() {
    super.initState();
    _game_code_controller.text = widget._game_code;
    print(widget._game_code);
  }

  void handle_position(value){
    setState(() {
      _position_value = value;
    });
  }

  bool validator(){
    if(_name_controller.text != "" && _position_value != null){
      return true;
    }

    return false;
  }


  @override
  Widget build(BuildContext context) {


    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      // color: Colors.green,
      child: Column(
        children: [

          Text(
              "Game Code"
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            enabled: false,
            controller: _game_code_controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Add Players"),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _name_controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter The Players Name'),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Radio(
                    value: Player.WR,
                    groupValue: _position_value,
                    onChanged: handle_position,
                  ),
                  Text(
                    'WR'
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: Player.QB,
                    groupValue: _position_value,
                    onChanged: handle_position,
                  ),
                  Text(
                      Player.QB
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: Player.RB,
                    groupValue: _position_value,
                    onChanged: handle_position,
                  ),
                  Text(
                      Player.RB
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            children: [
              Expanded(
                child: RaisedButton(
                  child: Text("Add"),
                  onPressed: (){
                    print('pressed');
                    if (validator()){
                      _name_controller.text = "";
                      _position_value = null;
                      widget._add_player(Player(_name_controller.text, _position_value));

                    }else{
                      setState(() {
                        showToast(
                          " Please fill in all the form fields!! ",
                          position: ToastPosition.center,
                        );
                      });
                    }
                  },
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
