class Player{
  String _name;
  String _position;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Player(String name, String position){
    _name = name;
    _position = position;
  }

  String get position => _position;

  set position(String value) {
    _position = value;
  }
}