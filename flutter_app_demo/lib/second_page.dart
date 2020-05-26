import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'first_page.dart';

class SecondPageCN extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add() {
    _count ++;
    notifyListeners();
  }
}

typedef CounterCallBack = int Function();

class SecondPage extends StatelessWidget {
  final counterCallBack;

  const SecondPage({Key key, this.counterCallBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Text('count = ${Provider.of<SecondPageCN>(context).count}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<SecondPageCN>(context, listen: false).add();
          counterCallBack(Provider.of<SecondPageCN>(context, listen: false).count);
        },
      ),
    );
  }
}
