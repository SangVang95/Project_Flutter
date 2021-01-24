import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Normal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNormal(MyCenter()),
    );
  }
}

class MyNormal extends StatefulWidget {
  final Widget child;
  MyNormal(this.child);

  @override
  _MyNormalState createState() => _MyNormalState();
}

class _MyNormalState extends State<MyNormal> {
  var _counter = 0;

  @override
  void initState() {
    super.initState();
    getCount();
  }

  void getCount() async {
    await delay().then((value) => {_counter = value});
    setState(() {
      print("setState");
    });
  }

  Future<int> delay() {
    var result = 0;
    for (var i = 0; i < 3000; i++) {
      print(i);
      result = i;
    }
    return Future.delayed(Duration(seconds: 4), () => result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text inheritWidget'),
      ),
      body: Container(
        child: NormalInheritWidget(widget.child, _counter),
      ),
    );
  }
}

class MyCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NormalText(),
    );
  }
}

class NormalText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('${NormalInheritWidget.of(context).counter}');
  }
}

class NormalInheritWidget extends InheritedWidget {
  final int counter;
  final Widget child;

  NormalInheritWidget(this.child, this.counter);
  @override
  bool updateShouldNotify(NormalInheritWidget oldWidget) {
    return counter != oldWidget.counter;
  }

  static NormalInheritWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NormalInheritWidget>();
  }
}
