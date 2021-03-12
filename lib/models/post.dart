class Post{
  String title,body;
  int userId,id;
  Post({this.id,this.body,this.title,this.userId});
  Post.fromMap(Map<String,dynamic> map){
    userId = map['userId'];
    id = map['id'];
    title = map['title'];
    body = map['body'];
  }
}