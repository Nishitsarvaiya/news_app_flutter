import 'package:flutter/material.dart';
import 'package:news_flutter/models/story.dart';
import 'package:news_flutter/utils/color_palette.dart';
import 'package:news_flutter/utils/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List _images = [
    'https://static2.cbrimages.com/wordpress/wp-content/uploads/2020/01/Batman-v-Superman-Bruce-Wayne-Ben-Affleck.jpeg?q=50&fit=crop&w=798&h=407',
    'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202001/streetdancer-770x433.jpeg?opFx2IudM8x4Uy8iLAH3FHbYTOMGxnMz',
    'https://static-ssl.businessinsider.com/image/5dd9bf17fd9db2165f33e343-1571/gettyimages-1183851343.jpg',
    'https://cdn.neow.in/news/images/uploaded/2019/12/1576868520_o4_story.jpg'
  ];

  List _categories = ['Comics', 'Entertainment', 'Technology', 'Trending'];

  List _headings = [
    'Batman v Superman Concept Art Shows a Beefy, Non-Affleck Dark Knight',
    'Street Dancer 3D box office collection: Day 4',
    'Tesla CEO Elon Musk was spotted cruising in the futuristic Cybertruck again',
    'OnePlus lists camera improvements coming to current and future smartphones'
  ];

  List stories;

  @override
  void initState() {
    super.initState();

    stories = List.generate(_images.length, (i) => Story(_images[i], _categories[i], _headings[i]));
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      height: SizeConfig.safeBlockVertical * 90,
      initialPage: 0,
      viewportFraction: 0.85,
      enlargeCenterPage: true,
      enableInfiniteScroll: false,
      itemCount: _images.length,
      scrollPhysics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Container(
              // color: ColorPalette.black,
              height: SizeConfig.safeBlockVertical * 60,
              width: SizeConfig.safeBlockVertical * 80,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      stories[index].imageUrl,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              stories[index].category,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Container(
              width: SizeConfig.safeBlockHorizontal * 70,
              child: Text(
                stories[index].headline,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
