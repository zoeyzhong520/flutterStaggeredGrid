import 'package:flutter/material.dart';
// 导入index_page.dart
import 'index_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 调用IndexPage()方法，填充组件
      home: IndexPage(),
      theme: new ThemeData(
        primaryColor: Colors.blue
      ),
    );
  }
}
