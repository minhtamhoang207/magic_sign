import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Gap(15)
              ),
              SliverToBoxAdapter(
                child: _header(),
              ),
              SliverToBoxAdapter(child: _divider()),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Text('Feature',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(15),
                sliver: SliverGrid(
                  key: GlobalKey(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return _feature();
                    },
                    childCount: 4,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: _divider()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                  child: Row(
                    children: const [
                      Text('Latest News',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                      Spacer(),
                      Text('See all',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF0085FF))),
                      Gap(3),
                      Icon(Icons.navigate_next_rounded, color: Color(0xFF0085FF))
                    ],
                  ),
                ),
              ),
              SliverList(
                  key: GlobalKey(),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return _lastestNewsItem();
                    },
                    childCount: 20,
                  )),
            ],
          )),
    );
  }
}

Widget _header() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Gap(15),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Hello, Tomoeee',
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
            Gap(5),
            Text('How do you feel today?',
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black38))
          ],
        ),
      ),
      const CircleAvatar(
        backgroundImage: NetworkImage(
            'https://scitechdaily.com/images/Cat-COVID-19-Mask-777x518.jpg?ezimgfmt=rs:350x233/rscb2/ngcb2/notWebP'),
      ),
      const Gap(15),
    ],
  );
}

Widget _divider() {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10, right: Get.width / 2 - 40),
    height: 3,
    decoration: const BoxDecoration(
      color: Color(0xFF0085FF),
    ),
  );
}

Widget _feature() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1.5,
          blurRadius: 3,
          offset: const Offset(0, 1.5), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          height: 90,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://scitechdaily.com/images/Cat-COVID-19-Mask-777x518.jpg?ezimgfmt=rs:350x233/rscb2/ngcb2/notWebP'))),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: FittedBox(
            child: Text('Translate sign language \ninto text/speech and so on ...',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black87)),
          ),
        )
      ],
    ),
  );
}

Widget _lastestNewsItem() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: SizedBox(
      height: Get.width / 3 - 20,
      child: Row(
        children: [
          Container(
            height: Get.width / 3 - 20,
            width: Get.width / 2 - 50,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(18),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://scitechdaily.com/images/Cat-COVID-19-Mask-777x518.jpg?ezimgfmt=rs:350x233/rscb2/ngcb2/notWebP'))),
          ),
          const Gap(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const FittedBox(
                  child: Text('Technology',
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.black45)),
                ),
                const Gap(5),
                const Expanded(
                  child: Text('Yampei mua Apple Yampei mua Apple Yampei mua Apple Yampei mua AppleYampei mua Apple Yampei mua Apple',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black87)),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: const [
                      Icon(Icons.access_time_outlined, size: 15, color: Colors.black45),
                      Gap(10),
                      Expanded(child: Text('Nhiều năm trước',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black45)))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
