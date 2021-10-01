# 如何使用Flutter创建一个瀑布流布局的应用？
前言

本文着眼于搭建一个瀑布流布局的简化版Flutter应用，Joe大叔将从应用创建、插件引入、页面布局三个方面，给朋友们展示瀑布流的布局方式。既此，我们接着往下看

# 一、瀑布流是什么？
瀑布流又称瀑布流式布局，是比较流行的一种网站页面布局方式。视觉表现为参差不齐的多栏布局。即多行等宽元素排列，后面的元素依次添加到其后，等宽不等高，根据图片原比例缩放直至宽度达到我们的要求，依次按照规则放入指定位置。

案例如下图：

![image](https://user-images.githubusercontent.com/22392094/135552792-63b15c10-31b4-43ec-987a-e3084f2758af.png)

# 二、创建瀑布流应用

## 1.新建应用
1.1创建过程不再赘述，可以参照Flutter中文网按步骤操作

1.2在lib目录下，创建一个名为pages的目录，在pages里继续新建两个dart文件，分别命名为home_page.dart（首页）、mine_page.dart（我的）。

再创建一个名为Tools的目录，在Tools里新建名为full_screen_image_page.dart的文件，此为图片详情页。

在lib根目录新建一个名为index_page.dart文件，此为页面管理页。

最终目录结构如下图：

![image](https://user-images.githubusercontent.com/22392094/135552918-2ce4e170-5ccb-4e1e-a116-a63daf5381cc.png)

## 2.配置底部导航栏
2.1开始配置底部导航栏，需要在index_page.dart里进行配置

2.2引入home_page、mine_page：
```
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/mine_page.dart';
```

2.3配置底部导航栏按钮数组：
```
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
}
```

2.4创建容器数组等变量：
```
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
```

2.5在build方法中，配置bottomNavigationBar：
```
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
```

## 3.引入布局插件
3.1首先定位到pubspec.yaml中，并在适当位置添加要引入的插件，瀑布流插件名为flutter_staggered_grid_view，之后运行pub get即可
```
dependencies:
  flutter:
    sdk: flutter
  flutter_staggered_grid_view:
  cached_network_image: ^2.2.0+1
```

3.2前往home_page.dart并引入文件
```
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
```

## 4.页面搭建
4.1在home_page.dart里使用瀑布流插件

4.1.1定义瀑布流子项的Widget


4.1在home_page.dart里使用瀑布流插
```
// 瀑布流每个子项
  Widget itemWidget(context, int index) {
    String imgPath = imgList[index];
    return new Material(
      elevation: 8.0,
      borderRadius: new BorderRadius.all(
        new Radius.circular(8.0),
      ),
      child: new InkWell(
        child: new Hero(
            tag: imgPath,
            child: CachedNetworkImage(
              imageUrl: imgPath,
              fit: BoxFit.fitWidth,
        )
        ),
        onTap: () {
          
        },
      ),
    );
  }
```

4.1.2实现build方法，图片数组根据自己需求放入图片地址即可
```
class HomePage extends StatelessWidget {
  // 图片数组
  final List imgList = [];
 
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8.0),
        crossAxisCount: 4,
        itemCount: imgList.length,
        itemBuilder: (context, i) {
          return itemWidget(context, i);
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index == 0 ? 2.5 : 3),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}
```

4.1.3在full_screen_image_page.dart中完善图片详情页
```
import 'package:flutter/material.dart';
 
// 图片详情页
 
class FullScreenImagePage extends StatefulWidget {
  final String imageUrl;
  final int curentIndex;
  const FullScreenImagePage({key, required this.imageUrl, required this.curentIndex}) : super(key: key);
 
  @override
  _FullScreenImagePageState createState() {
    return _FullScreenImagePageState();
  }
 
}
 
class _FullScreenImagePageState extends State<FullScreenImagePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
 
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('图片${widget.curentIndex+1}',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Image.network(widget.imageUrl, fit: BoxFit.fitWidth,),
      ),
    );
  }
}
```

4.1.4最后在main.dart应用入口处创建IndexPage的实例
```
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
```

# 总结
经过我们一番不懈的努力，总算是完成了瀑布流布局的应用。Flutter中万物皆组件，瀑布流布局也可以自己来编写，但是会比较复杂。这里我们直接采用flutter_staggered_grid_view插件完成布局，大大提升了开发效率。本期有关Flutter的介绍到此结束了，我们下期再见！
