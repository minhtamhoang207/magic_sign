import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
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
        CarouselSlider.builder(
            itemCount: 15,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    _lastestNewsItem(itemIndex, pageViewIndex),
            options: CarouselOptions(
              aspectRatio: 4 / 2.6,
              initialPage: 0,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
              padEnds: false,
              autoPlayCurve: Curves.decelerate,
              viewportFraction: 0.9,
              scrollDirection: Axis.horizontal,
            )),
        const Gap(30),
        SizedBox(
          height: 40,
          width: Get.width,
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _topic(index);
            },
          ),
        ),
        const Gap(30),
        Column(
          children: List.generate(
              100,
              (index) => SizedBox(
                    width: Get.width,
                    height: Get.width / 2,
                    child: _topicItem(index),
                  )),
        )
      ],
    ));
  }
}

Widget _lastestNewsItem(int itemIndex, int pageIndex) {
  return Stack(
    children: [
      GestureDetector(
        onTap: (){
          Get.toNamed(Routes.LEARNING, arguments: 'fhero$itemIndex');
        },
        child: Container(
          margin: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://i.ytimg.com/vi/317jz-PU7Mg/maxresdefault.jpg'))),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Gap(20),
            Text('by Tomoe Cruise',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
            Gap(5),
            Text(
                'Crypto investors should be prepared to lose all their money, BOE governor says by Tomoe Cruise by Tomoe Cruiseby Tomoe Cruise by Tomoe Cruise ',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Spacer(),
            Text(
                '“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 11))
          ],
        ),
      )
    ],
  );
}

Widget _topic(int index) {
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
          borderRadius: BorderRadius.circular(30),
          color: index == 0 ? const Color(0xFFFF3A44) : Colors.white),
      child: Center(
        child: Text(
          'Technology',
          style: TextStyle(
              color: index == 0 ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

Widget _topicItem(int index) {
  return GestureDetector(
    onTap: (){
      Get.toNamed(Routes.LEARNING, arguments: 'hero$index');
    },
    child: Stack(
      children: [
        Hero(
          tag: 'hero$index',
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://i.ytimg.com/vi/317jz-PU7Mg/maxresdefault.jpg'))),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('5 things to know about the \'conundrum\' of lupus',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
              const Spacer(),
              Row(
                children: [
                  const Expanded(
                      child: Text('David BeckTom x ChickSonSock',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12))),
                  const Gap(15),
                  Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.access_time, size: 15, color: Colors.white),
                          Gap(10),
                          Flexible(
                            child: Text('Sunday, 9 May 2021',
                                maxLines: 1,
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)
                            ),
                          )
                        ],
                      )
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
