import 'package:flutter/material.dart';

import '../../default_radio_button.dart';
import '../../settings.dart';

class EndDrivePopUp extends StatefulWidget {
  Function _finishDrive, _hide_pop_up;

  EndDrivePopUp(this._finishDrive, this._hide_pop_up);

  @override
  _EndDrivePopUpState createState() => _EndDrivePopUpState();
}

class _EndDrivePopUpState extends State<EndDrivePopUp> {
  String _endDriveValue;

  void handle_end_drive_value(value) {
    setState(() {
      _endDriveValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      constraints: BoxConstraints(maxWidth: 500, maxHeight: double.infinity),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "How Did the Drive End",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: ()=> widget._hide_pop_up(),
                )
              ],
            ),
            SizedBox(height: 10.0),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for(String option in Settings.driveEndOptions)
                    DefaultRadioButton(option, option, _endDriveValue, handle_end_drive_value)

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Finish"),
                  color: Settings.lightBlue,
                  onPressed: (){
                    if(_endDriveValue != null){
                      widget._finishDrive(_endDriveValue);
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
