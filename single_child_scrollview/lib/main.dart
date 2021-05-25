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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController();

  var count = 0;
  var height = 100.0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            count++;
          });
        },
        controller: controller,
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  color: Colors.grey,
                  height: 200,
                  width: width,
                ),
                Positioned(
                  top: 200,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        height = details.localPosition.dy;
                        print(height);
                        if (height <= 50) {
                          height = 50;
                        }
                      });
                    },
                    child: Container(
                      height: height,
                      width: 100,
                      color: Colors.yellow,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.pink,
            child: Center(
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    height += details.localPosition.dy;
                  });
                },
                child: Container(
                  height: height,
                  width: 100,
                  color: Colors.yellow,
                  child: Text("$count",
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
