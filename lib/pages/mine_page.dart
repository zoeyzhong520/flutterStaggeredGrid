import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.info),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('关于我们'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('设置'),
            onTap: () {

            },
          )
        ],
      ),
    );
  }
}