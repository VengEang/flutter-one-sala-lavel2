import 'package:flutter/material.dart';
import 'package:flutter_app/repos/data_repo.dart';
import 'package:flutter_app/screens/screen1.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lavel 2"),
          centerTitle: true,
        ),
        body: _buildBody,
    ),
    );
  }
}
  get _buildBody{
    return Container(
      child: FutureBuilder(
        future: getData,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print(snapshot.error);
            return Center(
              child: Text("Something wrong wile loading..."),
            );
          }
          else{
            if(snapshot.connectionState==ConnectionState.done){
              print(snapshot.data);
              return Center(
                child: RaisedButton(
                  child: Text("Click here"),
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Screen1();
                    }));
                  }
                )
              );
            }
            else{
              return Center(
                child: SpinKitDoubleBounce(color: Colors.blue,),
              );
            }
          }
        },
      ),
    );
  }
