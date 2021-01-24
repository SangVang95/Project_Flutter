import 'package:cubit/normal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Normal());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(
        myChild: MyCenterWidget(),
      ),
    );
  }
}

class App extends StatefulWidget {
  final Widget myChild;
  App({this.myChild});
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CUBIT'),
      ),
      body: Scaffold(
        body: MyinheritWidget(
          child: widget.myChild,
          data: _counter,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Rebuild Center");
    return Center(
      child: MyText(),
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild Mytext');
    final counter = MyinheritWidget.of(context).data;
    return Text('Tui là widget Text. Data của tui hiện tại là: $counter');
  }
}

class MyinheritWidget extends InheritedWidget {
  final int data;
  MyinheritWidget({Widget child, this.data}) : super(child: child);

  // cho phep widget con nao su dung data dc rebuild if == true
  @override
  bool updateShouldNotify(MyinheritWidget oldWidget) {
    return data != oldWidget.data;
  }

  static MyinheritWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyinheritWidget>();
  }
}
