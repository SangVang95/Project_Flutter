


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {

  StreamController<int> _controller = StreamController<int>();
  int _count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.close();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Stream'),),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            StreamBuilder(
                stream: _controller.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container (
                        child: Text ("${snapshot.data == null ? "0" : snapshot.data}", style: TextStyle (fontSize: 40),)
                    );
                  } else {
                    return Container();
                  }
                }
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text('Increment'),
              onPressed: () {
                _controller.sink.add(_count++);
              },
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text('Decrement'),
              onPressed: () {
                _controller.sink.add(_count--);
              },
            )
          ],
        ),
      ),
    );
  }

}