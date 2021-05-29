import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  @override
  _SandBoxState createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _margin = 0;
  double _opacity = 1;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 900),
          color: _color,
          width: _width,
          margin: EdgeInsets.all(_margin),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => setState(() => _margin = 50),
                  child: Text('Animate margin')),
              ElevatedButton(
                  onPressed: () => setState(() => _color = Colors.red),
                  child: Text('Animate color')),
              ElevatedButton(
                  onPressed: () => setState(() => _width = 100),
                  child: Text('Animate width')),
              ElevatedButton(
                  onPressed: () => setState(() => _opacity = 0),
                  child: Text('Animate opacity')),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: Text(
                  'Hide me',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
