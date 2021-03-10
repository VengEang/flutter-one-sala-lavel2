import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<int> add(int a,int b){
    return Future.delayed(Duration(milliseconds:10000),()=>a+b);
  }
  Future<String> someFunction(name){
    Future<String> myName=Future.delayed(Duration(seconds: 3),(){
      return "Hello $name";
    });
    return myName;
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lavel 2"),
          centerTitle: true,
        ),
        body: _buildBody2,
    ),
    );
  }
  get _buildBody{
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
        future: add(10, 20),
        builder: (context,snapshot){
          if(snapshot.hasError)
            return Center(
                child: Text("Error = ${snapshot.error}",
                  style: TextStyle(fontSize: 30),
                )
            );
          else{
            if(snapshot.connectionState==ConnectionState.done){
              return Center(
                child: Text(
                  "Data = ${snapshot.data}",
                  style: TextStyle(fontSize: 30),
                ),
              );
            }
            else{
              // return CircularProgressIndicator();
              return Text("Loading....");
            }
          }
        },
      ),
    );
  }
  get _buildBody2{
    return Container(
      color: Colors.blue,
      // alignment: Alignment.center,
      child: FutureBuilder(
        future: someFunction("veng eang"),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("Error = ${snapshot.hasError}",
              style: TextStyle(fontSize: 30),),
            );
          }
          else{
            if(snapshot.connectionState==ConnectionState.done)
              return Center(
                child: Text("Data : ${snapshot.data}",
                style: TextStyle(fontSize: 30),),
              );
            else{
              return Center(child: CircularProgressIndicator(backgroundColor: Colors.black,));
            }
          }
        },
      ),
    );
  }
}
