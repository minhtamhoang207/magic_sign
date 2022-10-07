import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:magic_sign/app/pages/dash_board/controllers/dash_board_controller.dart';
import 'package:magic_sign/data/models/news.dart';

import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/date_time.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Gap(15)),
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
                  return _feature(index);
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
                children: [
                  const Text('Latest News',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Get.find<DashBoardController>().setIndex(index: 1);
                        // Get.toNamed(Routes.EXPLORE);
                      },
                      child: const Text('See all',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF0085FF)))),
                  const Gap(3),
                  const Icon(Icons.navigate_next_rounded,
                      color: Color(0xFF0085FF))
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 30),
            sliver: controller.obx(
                (state) => SliverList(
                    key: GlobalKey(),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _lastestNewsItem(
                            index, controller.news.value[index]);
                      },
                      childCount: controller.news.value.length >= 12
                          ? 12
                          : controller.news.value.length,
                    )),
                onLoading: const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                onError: (e) => Center(
                      child: Text(e ?? ''),
                    )),
          )
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

Widget _feature(int index) {
  final controller = Get.find<HomeController>();
  return GestureDetector(
    onTap: (){
      if(index == 0){
        Get.toNamed(Routes.TEXT_TO_SIGN);
      }
    },
    child: Container(
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Assets.image.imgFeature.path))),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: AutoSizeText(controller.listFeature[index],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  minFontSize: 12,
                  maxFontSize: 14,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black87)),
            ),
          ),
          const Gap(8)
        ],
      ),
    ),
  );
}

Widget _lastestNewsItem(int index, Article? article) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: GestureDetector(
      onTap: () {
        Get.toNamed(Routes.NEWS_DETAIL,
            arguments: {'heroTag': 'hero$index', 'article': article});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: Get.width / 3,
        child: Row(
          children: [
            Hero(
              tag: 'hero$index',
              child: Container(
                height: Get.width / 3,
                width: Get.width / 2 - 40,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(article?.urlToImage ?? ''))),
              ),
            ),
            const Gap(15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
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
                    Expanded(
                      child: Text(
                          article?.title??'',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87)),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          const Icon(Icons.access_time_outlined,
                              size: 15, color: Colors.black45),
                          const Gap(10),
                          Expanded(
                              child: Text(
                                  AppDateTime.formatDateTypeWeekDay(article?.publishedAt),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black45)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
