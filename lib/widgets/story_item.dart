import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  StoryItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  int index;
  bool isLive = true;

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
                      child: const CircleAvatar(
                        radius: 26,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
                        ),
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
                      margin: EdgeInsets.only(bottom: 6.0),
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            isLive == true
                                ? Color(0xff6c00fe)
                                : Color(0xfff47e00),
                            isLive == true
                                ? Color(0xfff40096)
                                : Color(0xfff47e00),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      padding: const EdgeInsets.all(2.0),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80"),
                        ),
                      ),
                    ),
                    isLive == true
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
          Text("Votre story")
        ],
      ),
    );
  }
}
