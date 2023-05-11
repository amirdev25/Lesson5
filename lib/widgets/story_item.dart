import 'package:flutter/material.dart';
import 'package:lesson5/data/models/story_model.dart';

class StoryItem extends StatelessWidget {
  StoryItem({
    Key? key,
    required this.index,
    required this.storyModel,
  }) : super(key: key);

  int index;
  StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          index == 0
              ? Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                        right: 10.0,
                      ),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage: NetworkImage(storyModel.imgUrl),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4.0)),
                      child: const Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ],
                )
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 6.0),
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            storyModel.isLive == true
                                ? Color(0xff6c00fe)
                                : Color(0xfff47e00),
                            storyModel.isLive == true
                                ? Color(0xfff40096)
                                : Color(0xfff47e00),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(storyModel.imgUrl),
                        ),
                      ),
                    ),
                    storyModel.isLive == true
                        ? Container(
                            height: 16,
                            width: 24,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff6c00fe),
                                  Color(0xfff40006),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            child: const Text(
                              "LIVE",
                              style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
          const SizedBox(
            height: 8.0,
          ),
          Text(storyModel.name)
        ],
      ),
    );
  }
}
