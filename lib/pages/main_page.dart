import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson5/data/models/post_model.dart';
import 'package:lesson5/data/models/story_model.dart';
import 'package:lesson5/data/repository/data_repository.dart';
import 'package:lesson5/widgets/story_item.dart';
import 'package:lesson5/widgets/post_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DataRepository dataRepository = DataRepository();
  List<StoryModel> storyList = [];
  List<PostModel> postList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    print(storyList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: SvgPicture.asset("assets/icons/instagram.svg"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/add.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/add.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/add.svg"),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 120,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 40,
              itemBuilder: (context, index) {
                return StoryItem(index: index);
              },
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return const PostItem();
            },
          ),
        ],
      ),
    );
  }

  void loadData() async {
    postList = await dataRepository.loadPostList();
    storyList = await dataRepository.loadStoryList();

    setState(() {});
  }
}
