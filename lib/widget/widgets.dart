import 'package:flutter/material.dart';

import '../utils/strings.dart';

class Widgets {

  static final AppBar mainAppBar = AppBar(
    title: Center(child: Text(Strings.APP_NAME)),
    actions: <Widget>[
      GestureDetector(
        child: CircleAvatar(
          radius: 8,
          child: IconButton(
            icon: Icon(Icons.portrait),
            onPressed: null,
          ),
        ),
      ),
    ],
  );
}
