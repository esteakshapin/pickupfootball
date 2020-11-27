import 'dart:ui';

class Settings{
  bool _qb_playing_offense_and_defense;
  int _rotate_after_drive, _score_amnt, _num_of_players_on_field;
  bool _starting_possesion;

  static final Color darkGreen = Color(0xFF405d3a);
  static final Color lightGreen = Color(0xFFa6c64c);
  static final Color darkRed = Color(0xFFc80003);
  static final Color lightRed = Color(0xFFff955f);
  static final Color lightBlue = Color(0xFF86c6be);



  Settings(this._qb_playing_offense_and_defense, this._rotate_after_drive,
      this._score_amnt, this._starting_possesion, this._num_of_players_on_field);

  get num_of_players_on_field => _num_of_players_on_field;

  set num_of_players_on_field(value) {
    _num_of_players_on_field = value;
  }

  bool get starting_possesion => _starting_possesion;

  set starting_possesion(bool value) {
    _starting_possesion = value;
  }

  int get rotate_after_drive => _rotate_after_drive;

  set rotate_after_drive(int value) {
    _rotate_after_drive = value;
  }

  bool get qb_playing_offense_and_defense => _qb_playing_offense_and_defense;

  set qb_playing_offense_and_defense(bool value) {
    _qb_playing_offense_and_defense = value;
  }

  get score_amnt => _score_amnt;

  set score_amnt(value) {
    _score_amnt = value;
  }
}