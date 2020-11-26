class Player{
  static String QB = "QB";
  static String WR = "WR";
  static String RB = "RB";

  String _name;
  String _position;
  bool _admin;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Player(String name, String position, {admin=false}){
    _name = name;
    _position = position;
    _admin = admin;
  }

  bool get admin => _admin;

  set admin(bool value) {
    _admin = value;
  }

  String get position => _position;

  set position(String value) {
    _position = value;
  }
}