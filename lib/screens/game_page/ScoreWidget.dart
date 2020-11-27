import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../settings.dart';

class ScoreWidget extends StatelessWidget {
  String _title, _score;
  bool _possession;

  ScoreWidget(this._title, this._score, this._possession);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration:
      BoxDecoration(border: Border.all(color: (_possession) ? Settings.darkGreen : Colors.black45, width: 3)),
      child: Column(
        children: [
          Row(
            children: [
              (_possession) ?
              Opacity(opacity: 1.0, child: Icon(Icons.sports_football)) : Opacity(opacity: 0.0, child: Icon(Icons.sports_football)) ,
              Text(
                _title,
                style: GoogleFonts.novaSquare(
                    textStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              Opacity(opacity: 0.0, child: Icon(Icons.sports_football)),
              //spacer to maitain same sapce
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _score,
            style: GoogleFonts.orbitron(
                textStyle:
                TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}