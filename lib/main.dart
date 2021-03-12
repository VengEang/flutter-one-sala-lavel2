import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/UsersPost.dart';
import 'package:flutter_app/repos/data_repo.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lavel 2"),
          centerTitle: true,
        ),
        body: buildPostUsers,
      ),
    );
  }
}

get buildPostUsers {
  return FutureBuilder<List<UsersPost>>(
      future: getPostUsers,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text(
              "Something wrong while loading....",
              style: TextStyle(fontSize: 30),
            ),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.done) {
            // print(snapshot.data);
            return _listUser(snapshot.data);
          } else {
            return SpinKitFadingCircle(
              color: Colors.black,
            );
          }
        }
      });
}

_listUser(List<UsersPost> data) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {
      print(data[index].id);
      return ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(data[index].title),
        subtitle: Text(data[index].body),
      );
    },
  );
}
