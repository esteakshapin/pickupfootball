class Player{
  static final String QB = "QB";
  static final String WR = "WR";
  static final String RB = "RB";

  String _name;
  String _position;
  bool _admin;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Player(this._name, this._position, [this._admin = false]);

  bool get admin => _admin;

  set admin(bool value) {
    _admin = value;
  }

  String get position => _position;

  set position(String value) {
    _position = value;
  }
}