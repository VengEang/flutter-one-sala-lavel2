import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Screen 1"),
          ),
          // body: SpinKitCircle(color: Colors.amber,),
        ),
      )
    );
  }
}
