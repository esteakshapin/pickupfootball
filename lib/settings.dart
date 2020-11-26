class Settings{
  String _qb_playing_offense_and_defense;
  int _rotate_after_drive, _score_amnt;

  Settings(this._qb_playing_offense_and_defense, this._rotate_after_drive,
      this._score_amnt);

  int get rotate_after_drive => _rotate_after_drive;

  set rotate_after_drive(int value) {
    _rotate_after_drive = value;
  }

  String get qb_playing_offense_and_defense => _qb_playing_offense_and_defense;

  set qb_playing_offense_and_defense(String value) {
    _qb_playing_offense_and_defense = value;
  }

  get score_amnt => _score_amnt;

  set score_amnt(value) {
    _score_amnt = value;
  }
}