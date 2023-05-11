import 'dart:convert';

import 'package:lesson5/data/constants.dart';
import 'package:lesson5/data/models/post_model.dart';
import 'package:lesson5/data/models/story_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class DataRepository {
  Future<List<StoryModel>> loadStoryList() async {
    List<StoryModel> storyList = [];
    String storyData = await rootBundle.loadString('assets/data/story.json');
    final sList = json.decode(storyData);

    storyList = (sList as List<dynamic>).map((item) {
      return StoryModel(
        item[Constants.FULLNAME] as String,
        item[Constants.AVATAR_URL] as String,
        item[Constants.IS_LIVE] as bool,
      );
    }).toList();

    return storyList;
  }

  Future<List<PostModel>> loadPostList() async {
    List<PostModel> postList = [];
    String postData = await rootBundle.loadString('assets/data/post.json');
    final pList = json.decode(postData);
    postList = (pList as List<dynamic>)
        .map((item) => PostModel.fromJson(item))
        .toList();
    return postList;
  }
}
