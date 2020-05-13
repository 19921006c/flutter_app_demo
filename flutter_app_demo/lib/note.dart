import 'package:flutter/material.dart';

void note() {
  // 快捷键
  // option + return, 快速创建父Widget
  // option + return, 将lessState改成fulState
  // option + command + B, 显示所有子类

  /// 1. Text, 富文本, Text.rich, TextSpan,
  Text.rich(TextSpan(
    children: [
      TextSpan(text: 'red', style: TextStyle(color: Colors.red)),
      TextSpan(text: 'green', style: TextStyle(color: Colors.green)),
      WidgetSpan(
        child: Icon(Icons.flag),
      ),
      TextSpan(text: 'blue', style: TextStyle(color: Colors.blue)),
    ],
  ),);

  /// 2. Button
  // FlatButton: 简单的文本button
  // OutlineButton: 带边框的button
  // FloatingActionButton:  悬浮button
  // 自定义button，图标，文字，圆角
  FlatButton(
    color: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      // Row, MainAxisSize.max是默认值，不设置，默认占据整行
      // MainAxisSize.min, 包裹内容
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.favorite),
        Text('自定义button'),
      ],
    ),
  );

  /// 3. Image
  // 网络图片
  Image(
    image: NetworkImage('www.xxx.com'),
    width: 200,
    height: 200,
    // fit: BoxFit.fill, 填充, 会变形
    // fit: BoxFit.contain, 默认值
    // fit: BoxFit.cover, 图片不会变形，只显示部分
    // fit: BoxFit.fitWidth, 宽度一定，高度会自适应
    // fit: BoxFit.fitHeight, 高度一定，宽度会自适应
    fit: BoxFit.fitHeight,
    // alignment: Alignment.bottomCenter,
    // -1 ~ 1, (-1, -1)左上角, (1,1)右下角
    alignment: Alignment(0, 0),
    // 混入颜色
    color: Colors.red,
    colorBlendMode: BlendMode.colorBurn,
    //Y轴无限重复
    repeat: ImageRepeat.repeatY,
  );
  // 本地图片
  // 1. 创建图片文件夹
  // 2. pubspec.yaml设置图片路径
  // images/name.jpg
  // images/2.0x/name.jpg
  // images/3.0x/name.jpg
  // name可以不写, 只需要些一个, [images/]就可以了
  // 3. 使用图片
  Image(
    image: AssetImage(''),
  );
}