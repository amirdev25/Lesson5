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
}
