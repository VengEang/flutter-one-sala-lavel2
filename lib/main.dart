import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<int> bouk(int a,int b){
    int h=a+b;
    return Future.value(h);
  }
  void sayHello(name){
    print("Hello $name");
  }
  Future sayHi(name){
    print("Hi $name");
  }
  Future sum(int a,int b){
    print("$a + $b = ${a+b}");
  }
  Future<int> add(int a,int b){
    return Future.value(a+b);
  }
  Future<double> mulDiv({num1,num2,num3}){
    int a=num1+num2;
    double b=a/num3;
    return Future.value(b);
  }

  Future<double> div1(double a,double b){
    double c=a*b;
    return Future.value(c);
  }
  _initWork()async{
    int buklek=await bouk(1000, 3000);
    print(buklek);
    double result=await div1(20, 60);
    print("hadlfj is $result");
    sayHello("vengeang");
    int r=await add(10,30);
    print("re is $r");
    sayHi("vengeang");
    sum(10, 20);
    add(20, 30).then((value) => print(value));
    mulDiv(num1: 10,num2: 20,num3: 30).then((value) {
      print("Result is $value");
    });
}


  @override
  void initState() {
    super.initState();
    _initWork();
  }

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("OOP is hard"),
          centerTitle: true,
        ),
        body: Container(),
      ),
    );

  }
}
