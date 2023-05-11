import '../constants.dart';

class PostModel {
  String fullName;
  String username;
  String avatarUrl;
  String postUrl;
  String postTitle;
  String postDescription;
  int commentCount;

  PostModel(this.fullName, this.username, this.avatarUrl, this.postUrl,
      this.postTitle, this.postDescription, this.commentCount);

  static PostModel fromJson(Map<String, dynamic> item){
    return PostModel(
      item[Constants.FULLNAME] as String,
      item[Constants.USERNAME] as String,
      item[Constants.AVATAR_URL] as String,
      item[Constants.POST_URL] as String,
      item[Constants.POST_TITLE] as String,
      item[Constants.POST_DESCRIPTION] as String,
      item[Constants.COMMENT_COUNT] as int,
    );
  }
}
