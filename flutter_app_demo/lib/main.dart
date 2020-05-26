import 'package:flutter/material.dart';

import 'first_page.dart';

main() {
//  runApp(MyApp());
  runApp(FirstPageApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'flutter app'
          ),
        ),
        body: HomePageBody(),
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageBodyState();
  }
}

class HomePageBodyState extends State<HomePageBody> {

  var flag = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: flag,
            onChanged: (value) {
              setState(() {
                flag = value;
              });
            },
          ),
          Text('check box'),
        ],
      ),
    );
  }

}

class Test extends StatelessWidget {
  // 1. 抽象类不可以实例化
  // Widget是一个抽象类
  // Widget();

  // 2. Text, 文本控件
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello, world',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}

