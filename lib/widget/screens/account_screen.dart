import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Account')
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Some text', style: TextStyle(fontSize: 26)),
              Text('Some text', style: TextStyle(fontSize: 24)),
              Text('Some text', style: TextStyle(fontSize: 22)),
              Text('Some text', style: TextStyle(fontSize: 20)),
              Text('Some text', style: TextStyle(fontSize: 18)),
              Text('Some text', style: TextStyle(fontSize: 16)),
              Text('Some text', style: TextStyle(fontSize: 14)),
              Text('Some text', style: TextStyle(fontSize: 12)),
              Text('Some text', style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
