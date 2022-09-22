import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const Gap(20),
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Latest News',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        const Gap(20),
        SizedBox(
          height: 300,
          width: Get.width,
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _lastestNewsItem();
            },
          ),
        ),
        const Gap(30),
        SizedBox(
          height: 40,
          width: Get.width,
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _topic();
            },
          ),
        ),
        // SizedBox(
        //   child: CarouselSlider.builder(
        //       itemCount: 15,
        //       itemBuilder:
        //           (BuildContext context, int itemIndex, int pageViewIndex) =>
        //               _lastestNewsItem(),
        //       options: CarouselOptions(
        //         aspectRatio: 16/9,
        //         initialPage: 0,
        //         enableInfiniteScroll: true,
        //         reverse: false,
        //         autoPlay: true,
        //         viewportFraction:1 ,
        //         enlargeStrategy: CenterPageEnlargeStrategy.height,
        //         autoPlayInterval: Duration(seconds: 3),
        //         autoPlayAnimationDuration: Duration(milliseconds: 800),
        //         autoPlayCurve: Curves.fastOutSlowIn,
        //         enlargeCenterPage: true,
        //         scrollDirection: Axis.horizontal,
        //       )),
        // )
         const Gap(30),
        Column(
          children: List.generate(100, (index) => Container(
            margin: EdgeInsets.only(bottom: 15, right: 20),
            width: Get.width,
            height: Get.width / 2,
            child: _lastestNewsItem(),
          )),
        )
      ],
    ));
  }
}

Widget _lastestNewsItem() {
  return Container(
    width: Get.width - 60,
    margin: const EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(18),
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/308137407_634585774731587_216712646799226020_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=ae9488&_nc_ohc=O0ZyuDqlHdEAX-Lw47f&tn=9RL8byVkHP78sUrO&_nc_ht=scontent.fhan14-2.fna&oh=03_AVL3IwI2oQKzvDEkOkgQJNALzWTHuJZCWlPOk-0bEFjpJA&oe=6353C31D'))),
  );
}

Widget _topic() {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Color(0xFFFF3A44)),
      child: Center(
        child: Text(
          'Technology',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
