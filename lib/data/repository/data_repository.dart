import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:lesson5/data/models/post_model.dart';
import 'package:lesson5/data/models/story_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class DataRepository {
  Future<List<StoryModel>> loadStoryList() async {
    List<StoryModel> storyList = [];
    String storyData = await rootBundle.loadString('assets/data/story.json');
    final sList = json.decode(storyData);

    sList.map((item) {
      print(item);
    }).toList();

    return storyList;
  }

  Future<List<PostModel>> loadPostList() async {
    List<PostModel> postList = [];
    String postData = await rootBundle.loadString('assets/data/post.json');
    final pList = json.decode(postData);
    return postList;
  }
}
