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