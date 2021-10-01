import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/mine_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // 底部导航按钮数组
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '首页'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '我的'
    )
  ];

  // 模块容器数组
  final List tabPages = [HomePage(), MinePage()];
  // 当前选择index
  int currentIndex = 0;
  // 当前页
  var currentPage;

  @override
  void initState() {
    // TODO: implement initState
    currentPage = tabPages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        onTap: (idx) {
          // 必须实现setState方法
          setState(() {
            currentIndex = idx;
            currentPage = tabPages[idx];
          });
        },
      ),
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: Text(
          bottomTabs[currentIndex].label.toString(),
          style: TextStyle(
              color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: .5,
      ),
      body: currentPage,
    );
  }
}