import 'package:flutter/material.dart';

void note() {
  // 快捷键
  // option + return, 快速创建父Widget
  // option + return, 将lessState改成fulState
  // option + command + B, 显示所有子类

  /// 叶子Widget
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
    // FlatButton, 默认宽高最小48, 不设置这个属性，会有一段空白, 间距
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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

  // FlatButton, 有最小的尺寸88, 36
  // 在外面包一层ButtonTheme, 来设置大小
  ButtonTheme(
    minWidth: 30,
    height: 30,
    child: FlatButton(
      // button内容有间距, 内间距, 设置padding
      padding: EdgeInsets.all(0),
      color: Colors.red,
      onPressed: () {
      },
    ),
  );

  //

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

  // 占位图
  FadeInImage(
    placeholder: AssetImage(''),
    image: NetworkImage(''),
    // 淡入淡出时间修改, 渐变
    fadeOutDuration: Duration(milliseconds: 1),
    fadeInDuration: Duration(days: 1),
  );
  // 图片缓存: 最多缓存1000张, 100M, 超过会清理, ImageCache可以设置

  /// 4. Icon
  // Icon是字体图标iconFont
  // 1. 字体图标矢量图（放大不会失真）
  // 2. 字体图标可以设置颜色
  // 3. 图标很多时，占据空间更小
  // IconData
  Icon(Icons.add);
  IconData(0xe145, fontFamily: 'MaterialIcons');
  // 字体图片，可以通过Text创建，效果相同
  // 1. 0xe145 -> unicode编码
  // 2. 设置对应字体
  Text(
    '\0xe145',
    style: TextStyle(
      fontSize: 100,
      color: Colors.orange,
      fontFamily: 'MaterialIcons',
    ),
  );

  /// 5. [TextField]
  // 监听文本编辑
  final userNameTextFiledController = TextEditingController();
  TextField(
    decoration: InputDecoration(
      // 提示文本，点击后会上移
      labelText: 'userName',
      // 左边添加图片
      icon: Icon(Icons.add),
      // 默认文本
      hintText: '',
      // 边框
      border: OutlineInputBorder(),
      // 内部填充颜色
      filled: true,
      fillColor: Colors.red[100],
    ),
    // 监听文字变化
    onChanged: (value) {
    },
    // 监听回车, Enter, Return,
    onSubmitted: (value) {
    },
    controller: userNameTextFiledController,
  );
  Container(
    // 填充父控件, 无限大
    width: double.infinity,
    child: FlatButton(
      child: Text(''),
      color: Colors.blue,
      onPressed: () {
        final username = userNameTextFiledController.text;
        // 设置输入框内容, 清空内容
        userNameTextFiledController.text = '';
        print(username);
      },
    ),
  );

  // 输入框颜色, 边框颜色
  Theme(
    data: ThemeData(
      primaryColor: Colors.red,
    ),
    child: TextField(
      decoration: InputDecoration(
        // 去除边框
        border: InputBorder.none
      ),
    ),
  );

  // 16进制颜色
  // Colors.white;
  Color(0xFFFFFF);

  /// 布局Widget
  /// 6. Align, Center相同

  // 限制Align大小
  Container(
    width: 100,
    height: 100,
    // 整个父控件大小
    child: Align(
      alignment: Alignment(-1, 1),
      // child大小的倍数
      widthFactor: 5,
      //
      heightFactor: 5,
      child: Icon(Icons.add, size: 50,),
    ),
  );

  /// 7. Padding
  Padding(
    // padding: EdgeInsets.all(10),
    //  水平，垂直方向设置间距
    // padding: EdgeInsets.symmetric(vertical: 5),
    padding: EdgeInsets.symmetric(horizontal: 5),

    child: Text(''),
  );
  /// 8. Container
  // child多大，Container多大
  // 或者自己设置宽高
  // 或者扩展到父容器大小
  Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    color: Colors.red,
    width: 100,
    height: 100,
    alignment: Alignment(1, 1),
    // 变化
    transform: Matrix4.rotationZ(100),
    // transform: Matrix4.translation(translation),
    // decoration和color会冲突
    decoration: BoxDecoration(
      color: Colors.red,
      // 边框
      border: Border.all(
        width: 5,
        color: Colors.red,
      ),
      // 圆角
      // 圆形图片
      borderRadius: BorderRadius.circular(10),
      // 阴影
      boxShadow: [
        BoxShadow(
            color: Colors.orange,
            offset: Offset(10, 10),
            spreadRadius: 5,
            blurRadius: 10
        ),
      ],
    ),

    // UI调试 Open DevTools

  );
}

void gitNote() {
//  # 基本操作
//
//  1. git init 创建版本库
//
//  2. git add file1.text    添加文件到暂存区
//
//  3. git commit -m "change content" 将暂存区文件添加到当前分支
//
//  4. git push 推送到远程仓库
//
//  # 放弃更改
//
//  1. git checkout -- name.text 未add
//
//  2. git checkout .   未add
//
//  3. git reset HEAD readme.md add完成
//
//  4. git reset HEAD . add完成
//
//  # 其他操作
//
//  * git commit 或者 git commit -m "xxxxx"
//
//  * git add --all 添加所有修改文件到暂存区
//
//  * git log 打印日志
//
//  * git reflog    打印命令日志
//
//  * git reset --hard HEAD^ 回退到上一个版本
//
//  * git reset --hard 547b108 指向指定版本
//
//  * git checkout -b dev 创建dev分支，并指向dev分支
//
//  * git branch dev    创建dev分支
//
//  * git checkout dev  指向dev分支
//
//  * git checkout master   指向master
//
//  * git merge dev 将dev合并到当前分支
//
//  * git branch -d dev 删除dev分支
//
//  * git log --graph --pretty=oneline --abbrev-commit  查看分支情况
//
//  * git branch -r 查看所有远程分支
//
//  * git branch -a 查看所有分支包括本地分支
//
//  * git merge --no-ff -m "merge with no-ff" dev   "--no-ff"禁用Fast forward模式, 将dev合并到master，分别指向各自的分支
//
//  * git stash 暂存当前修改, 清空工作区，之后可以恢复
//
//  * git branch -D feature-vulcan 删除未合并的分支时，需要强制删除
//
//  * git push origin master    推送分支到远程仓库
//
//  * git push origin BranchName		推送本地分支到远程
//
//  * git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
//
//  ## 标签
//
//  * git tag v1.0  打标签
//
//  * git tag   查看标签版本
//
//  * git tag v0.9 f52c633  给制定版本打标签
//
//  * git show v0.9 查看标签详情
//
//  * git tag -a v0.1 -m "version 0.1 released" 1094adb 注释    "-a"标签名, "-m"注释
//
//  * git tag -d v0.1   删除标签
//
//  * git push origin v1.0  推送标签到远程
//
//  * git push origin --tags    推送所有标签到远程
//
//  * git tag -d v0.9   先删除本地标签
//
//  * git push origin :refs/tags/v0.9   再删除远程标签
//
//  # 查看远程仓库
//
//  * git remote -v
//
//  * git remote
//
//  # bug分支
//
//  * git stash apply   恢复暂存，但不删除暂存区内容
//
//  * git stash pop     恢复暂存，删除暂存区内容
//
//  * git stash list    查看暂存区内容
//
//
//
//
//
//  ## 回退版本
//
//  1. git reset --hard HEAD^ 回退到上一个版本
//
//  2. git reset --hard 547b108 指向指定版本
//
//  ### 回退远程版本
//
//  1. git reset --hard HEAD^ 回退到上一个版本
//
//  2. git reset --hard 547b108 指向指定版本
//
//  3. git push --force / git push -f 强制推送到远程
//
//  # 合并commit
//
//  1. git rebase -i HEAD~2	/// 合并前两个commit
//
//      git rebase -i 3a4226b // 3a4226b之前，不包括3a4226b
//
//  2. git push -f
//
//  # 删除commit
//
//  1. git rebase -i [commmit id]
//
//  2.drop
//
//  # 删除未跟踪的文件
//
//  git clean -f
//
//  # 拉取远程分支到本地。
//
//  git checkout -b BR_topic/1.1.0/VoiceImpliment origin/BR_topic/1.1.0/VoiceImpliment
//
//  # 将某个commit合并到当前分支
//  git cherry-pick 5d47ecb
//
//  # 将已经commit，返回工作区 git reset --soft HEAD^
//
//  # 修改commit 注释
//  git commit --amend
}