import 'package:flutter/material.dart';

class DefaultRadioButton extends StatelessWidget {
  String _title;
  var _value, _groupValue;
  Function _onChanged;

  DefaultRadioButton(
      this._title, this._value, this._groupValue, this._onChanged);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: _value,
          groupValue: _groupValue,
          onChanged: _onChanged,
        ),
        Text(_title),
      ],
    );
  }
}
