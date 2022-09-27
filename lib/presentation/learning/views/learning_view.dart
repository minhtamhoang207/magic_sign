import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/learning_controller.dart';

class LearningView extends GetView<LearningController> {
  const LearningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: News(),
      ),
    );
  }
}

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate:
                  CustomSliverAppBarDelegate(expandedHeight: Get.height * 0.35),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Gap(25),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        const Gap(20),
                        const VerticalDivider(color: Colors.orange, thickness: 5),
                        const Gap(10),
                        Expanded(
                          child: Column(
                            children: [
                              const Text('Crypto investors should be prepared to lose all their money, BOE governor says',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                              const Gap(10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(Icons.access_time, color: Colors.black45, size: 16),
                                  Gap(8),
                                  Expanded(
                                    child: Text('Sunday, 9 May 2021',
                                        style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                                  ),
                                  Gap(15)
                                ],
                              ),
                              const Gap(5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(Icons.account_circle_rounded, color: Colors.black45, size: 16),
                                  Gap(8),
                                  Expanded(
                                    child: Text('Published by Ryan Browne',
                                        style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                                  ),
                                  Gap(15)
                                ],
                              ),
                            ],
                          )
                        ),
                        const Gap(15),
                      ],
                    ),
                  ),
                  const Gap(20),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                    """
LONDON — Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.

Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.

Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.”
                    """,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16)),
                  ),
                  const Gap(100)
                ]
              ),
            )
          ],
        ),
      );
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          title: const Text('News'),
          centerTitle: true,
          backgroundColor: const Color(0xFF326273),
        ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
      opacity: disappear(shrinkOffset),
      child: Stack(
        children: [
          Hero(
            tag: Get.find<LearningController>().heroTag,
            child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://i.ytimg.com/vi/XKeW08R2lYY/hqdefault.jpg')),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)))),
          ),
          Positioned(
              top: 15,
              left: 15,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                  shape: BoxShape.circle
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
          ),
        ],
      ));

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
