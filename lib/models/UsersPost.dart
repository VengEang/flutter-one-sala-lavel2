class UsersPost{
  int userId,id;
  String body,title;
  UsersPost({this.userId,this.id,this.body,this.title});
  UsersPost.fromUsersMap(Map < String , dynamic> usermap){
    userId=usermap['userId'];
    id=usermap['id'];
    title=usermap['title'];
    body=usermap['body'];
  }
}
