import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateGameSettings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Game"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Name"),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name'
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Position"),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
