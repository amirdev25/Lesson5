import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key}) : super(key: key);

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
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=800"),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Abror Sharopov",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "sharopov7121",
                          style: TextStyle(fontSize: 12.0),
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
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.all(16.0),
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
                const Text("Aimé par Gabdu et d’autres personnes"),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                    "ArthurHazan Quel plaisir de retrouver mes étudiants de Web 2 ! Ils ont tellement progressés depuis l’année dernière ! #Proud"),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Voir les 10 commentaires",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
