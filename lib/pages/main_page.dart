import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson5/data/constants.dart';
import 'package:lesson5/data/models/post_model.dart';
import 'package:lesson5/data/models/story_model.dart';
import 'package:lesson5/data/repository/data_repository.dart';
import 'package:lesson5/pages/splash_page.dart';
import 'package:lesson5/widgets/story_item.dart';
import 'package:lesson5/widgets/post_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DataRepository dataRepository = DataRepository();
  List<PostModel> postList = [];
  List<StoryModel> storyList = [];
  bool isDataLoaded = false;

  @override
  Widget build(BuildContext context) {
    if (isDataLoaded == false) {
      loadData();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: SvgPicture.asset("assets/icons/instagram.svg"),
        actions: [
          IconButton(
            onPressed: () async {
              final sharedPref = await SharedPreferences.getInstance();
              sharedPref.setBool(Constants.IS_LOGIN, false);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => SplashPage()),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout, color: Colors.black,),
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
      body: isDataLoaded == false
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody(),
    );
  }

  void loadData() async {
    postList = await dataRepository.loadPostList();
    storyList = await dataRepository.loadStoryList();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isDataLoaded = true;
      });
    });
  }

  _buildBody() {
    return ListView(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 120,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: storyList.length,
            itemBuilder: (context, index) {
              return StoryItem(
                index: index,
                storyModel: storyList[index],
              );
            },
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: postList.length,
          itemBuilder: (context, index) {
            return PostItem(
              postModel: postList[index],
            );
          },
        ),
      ],
    );
  }
}
