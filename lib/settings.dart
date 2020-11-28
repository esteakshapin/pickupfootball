import 'dart:ui';

class Settings{
  bool _qb_playing_offense_and_defense;
  int _rotate_num_of_people, _score_amnt, _num_of_players_on_field;
  bool _starting_possesion;

  // colors for our app
  static final Color darkGreen = Color(0xFF405d3a);
  static final Color lightGreen = Color(0xFF109648);
  static final Color apricot = Color(0xFFFFC9AD);
  static final Color lightRed = Color(0xFFff955f);
  static final Color lightBlue = Color(0xFF86c6be);
  static final Color slateGray = Color.fromRGBO(107, 113, 126, 1);
  static final Color cream = Color(0xFFF3FFBD);
  static final Color firebrick = Color(0xFFAB3428);
  static final Color emerald = Color(0xFF21E874);

  // const values for drive end
  static final String TOUCHDOWN = "Touchdown";
  static final String PUNT = "Punt";
  static final String TURNOVERONDOWNS = "Turn Over On Downs";
  static final String PICK = "Pick";
  static final String PICKSIX = "Pick Six";
  static final String FUMBLE = "Fumble";
  static final String SAFETY = "Safety";

  static final List<String> driveEndOptions = [TOUCHDOWN, PUNT, TURNOVERONDOWNS, PICK, PICKSIX, FUMBLE, SAFETY];
  static final List<int> turnOverPoints = [1, 0, 0, 0, -1, 0, 0];

  Settings(this._qb_playing_offense_and_defense, this._rotate_num_of_people,
      this._score_amnt, this._starting_possesion, this._num_of_players_on_field);

  get num_of_players_on_field => _num_of_players_on_field;

  set num_of_players_on_field(value) {
    _num_of_players_on_field = value;
  }

  bool get starting_possesion => _starting_possesion;

  set starting_possesion(bool value) {
    _starting_possesion = value;
  }

  int get rotate_num_of_people => _rotate_num_of_people;

  set rotate_num_of_people(int value) {
    _rotate_num_of_people = value;
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