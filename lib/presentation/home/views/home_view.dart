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
          body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _header(),
            ),
            SliverToBoxAdapter(child: _divider()),
            SliverGrid(
              key: GlobalKey(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 16/9,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _feature();
                },
                childCount: 4,
              ),
            ),
            SliverToBoxAdapter(child: _divider()),
            SliverList(
                key: GlobalKey(),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _lastestNewsItem();
                  },
                  childCount: 100,
                )),
          ],
        ),
      )),
    );
  }
}

Widget _header() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Hello Tomoeee',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
            Gap(8),
            Text('How do you feel today?',
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
      )
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
      borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.cover,
            image: NetworkImage(
                'https://scitechdaily.com/images/Cat-COVID-19-Mask-777x518.jpg?ezimgfmt=rs:350x233/rscb2/ngcb2/notWebP'))),
  );
}

Widget _lastestNewsItem() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        height: 90,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://scitechdaily.com/images/Cat-COVID-19-Mask-777x518.jpg?ezimgfmt=rs:350x233/rscb2/ngcb2/notWebP'))),
      ),
      const Gap(15),
      Expanded(
        child: SizedBox(
          height: 90,
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Tech bech',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black45)),
              Text('Yampei mua Apple',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Spacer(),
              Text('Nhieu nam truoc',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black45)),
            ],
          ),
        ),
      )
    ],
  );
}
