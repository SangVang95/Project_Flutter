import 'package:cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  // final Widget myChild;
  // App({this.myChild});
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  // int _counter = 0;
  @override
  Widget build(BuildContext context) {
    print("Rebuld");
    return Scaffold(
      appBar: AppBar(
        title: Text('CUBIT'),
      ),
      body: Scaffold(
        // body: MyinheritWidget(
        //   child: widget.myChild,
        //   data: _counter,
        // ),
        body: BlocBuilder<CounterCubit, CounterState>(
          builder: (_, state) {
            return Center(
              child: Text('${state.counter}'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CounterCubit>().increment();
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
