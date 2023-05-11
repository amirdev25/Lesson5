import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson5/data/models/post_model.dart';

class PostItem extends StatelessWidget {
  PostItem({Key? key, required this.postModel}) : super(key: key);
  PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(postModel.avatarUrl),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          postModel.fullName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          postModel.username,
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Image.network(
            postModel.postUrl,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/bookmark.svg"),
                          SvgPicture.asset("assets/icons/bookmark.svg"),
                          SvgPicture.asset("assets/icons/bookmark.svg"),
                        ],
                      ),
                    ),
                    Expanded(child: SvgPicture.asset("assets/icons/dots.svg")),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset("assets/icons/bookmark.svg"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(postModel.postTitle),
                const SizedBox(
                  height: 8.0,
                ),
                Text(postModel.postDescription),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Voir les ${postModel.commentCount} commentaires",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
