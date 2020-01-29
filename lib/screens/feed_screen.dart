import 'package:flutter/material.dart';
import 'package:news_flutter/ui/carousel.dart';
import 'package:news_flutter/utils/color_palette.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Today\'s Articles',
                      style: TextStyle(
                        fontFamily: 'TT Norms',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, top: 2),
                      child: Text(
                        'Recommended For You',
                        style: TextStyle(
                          fontFamily: 'TT Norms',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.apps),
                  iconSize: 30,
                  onPressed: () {
                    print('Menu clicked');
                  },
                )
              ],
            ),
          ),
          Expanded(child: Carousel())
        ],
      ),
    );
  }
}
