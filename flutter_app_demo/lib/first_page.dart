import 'package:flutter/material.dart';
import 'package:flutter_app_demo/second_page.dart';
import 'package:provider/provider.dart';



class FirstPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first page app',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => FirstPageCN(),
          ),

        ],
        child: FirstPage(),
      ),
    );
  }
}

class FirstPageCN extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add() {
    _count ++;
    notifyListeners();
  }

  void setCount(int value) {
    _count = value;
    notifyListeners();
  }
}

class FirstPage extends StatelessWidget {
  final custom = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
            child: Text('count = ${Provider.of<FirstPageCN>(context).count}'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 1,
            child: Icon(Icons.input),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (secondContext) {
                return MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (_) => SecondPageCN(),
                    ),
                  ],
                  child: SecondPage(counterCallBack: (value) {
                    Provider.of<FirstPageCN>(context, listen: false).setCount(value);

                  },),
                );
              }));
            },
          ),
          FloatingActionButton(
            heroTag: 2,
            child: Icon(Icons.add),
            onPressed: () {
              Provider.of<FirstPageCN>(context, listen: false).add();
            },
          ),
        ],
      ),
    );
  }
}

