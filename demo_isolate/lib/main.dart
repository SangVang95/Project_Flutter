import 'dart:isolate';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  AnimationController _controller;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds:  2))..repeat();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 300,
            width: 300,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(angle: _controller.value * 2 * pi,
                child: child,);
              },
              child: FlutterLogo(size: 200,),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
              child: Text("Computation"),
              onPressed: () {
                demoCompute();
              })
        ],
      ),
    );
  }
  // Tao isolate moi
  void newIsolate() async {
    // Main isolate
    var _recevicePort = ReceivePort();

    var newIsolate = await Isolate.spawn(counter, _recevicePort.sendPort);

    //kill isolate
    Future.delayed(Duration(seconds: 3), () {
      newIsolate.kill(priority: Isolate.immediate);
      print("kill isolate");
    });

    _recevicePort.listen((data) {
      print(data[0]);

      if (data[1] is SendPort) {
        data[1].send("FROm MAIN ISOlate");
      }

    });
  }
  // param cua spawn:
  // 1: static funcion, top function (ngang cap voi function voidMain())

  static void counter(SendPort sendPort) {

    var receviceport = ReceivePort();
    
    receviceport.listen((data) {
      print(data);
    });

    // New isolate
    var result = 0;
    for (var i = 0; i <= 100000000; i++) {
      result += i;
    }

    sendPort.send([result, receviceport.sendPort]);
  }

  // Compute
  void demoCompute()  async {
    var  result =  await compute(calculate, 1000000000);
    print(result);
  }

  static int calculate(int num) {
    var result = 0;
    for (var i = 0; i < num; i++) {
      result += i;
    }
    return result;
  }
}
