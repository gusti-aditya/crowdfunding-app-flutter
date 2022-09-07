import 'package:flutter/material.dart';

Widget loading() {
  return Dialog(
    child: new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Text("Loading"),
        new CircularProgressIndicator(),
      ],
    ),
  );
}
