import 'package:flutter/material.dart';
import 'package:news_flutter/screens/feed_screen.dart';
import 'package:news_flutter/utils/color_palette.dart';
import 'package:news_flutter/utils/size_config.dart';

class Layout extends StatefulWidget {
  static final String id = 'home-screen';
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentTab = 1;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentTab);
  }

  void _onPageChanged(index) {
    setState(() {
      _currentTab = index;
    });

    _pageController.animateToPage(_currentTab, duration: Duration(milliseconds: 250), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: ColorPalette.white,
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _currentTab,
        //   backgroundColor: ColorPalette.white,
        //   elevation: 0,
        //   iconSize: 30,
        //   selectedIconTheme: IconThemeData(size: 36),
        //   selectedItemColor: ColorPalette.blue,
        //   unselectedItemColor: ColorPalette.grey,
        //   type: BottomNavigationBarType.fixed,
        //   onTap: _onPageChanged,
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.search),
        //       title: Container(),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.offline_bolt),
        //       title: Container(),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.bookmark_border),
        //       title: Container(),
        //     ),
        //   ],
        // ),
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                child: Center(
                  child: Text('Search'),
                ),
              ),
              FeedScreen(),
              Container(
                child: Center(
                  child: Text('Favorites'),
                ),
              )
            ],
          ),
        ));
  }
}
