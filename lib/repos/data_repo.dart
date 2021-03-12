import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/UsersPost.dart';
import 'package:flutter_app/models/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> get getPost async {
  String url = "https://jsonplaceholder.typicode.com/posts?userId=10";
  http.Response res = await http.get(url);
  if (res.statusCode == 200) {
    return compute(convert, res.body);
  } else {
    throw Exception("Error Code: ${res.statusCode}");
  }
}

List<Post> convert(String data) {
  List list = json.decode(data);
  List<Post> postList = list.map((e) => Post.fromMap(e)).toList();
  return postList;
}

Future<List<UsersPost>> get getPostUsers async {
  String url = "https://jsonplaceholder.typicode.com/posts?users=1000";
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return convertUser(response.body);
  } else {
    throw Exception("Error Code:${response.statusCode}");
  }
}

List<UsersPost> convertUser(String usersData) {
  List list = json.decode(usersData);
  List<UsersPost> usersPost =
      list.map((m) => UsersPost.fromUsersMap(m)).toList();
  return usersPost;
}
