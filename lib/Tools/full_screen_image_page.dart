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