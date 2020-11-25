import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickupfootball/create_game.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateGameSettings()))
                },
                child: Text("Create New Game"),
                padding: EdgeInsets.all(30),
              ),
              SizedBox(
                height: 20,
              ),

              // TODO: make buttons the same size

              RaisedButton(
                onPressed: null,
                child: Text("Join Game"),
                padding: EdgeInsets.all(30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
