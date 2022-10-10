import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:magic_sign/gen/assets.gen.dart';
import '../../../../config/routes/app_pages.dart';
import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Example());
  }
}

class Example extends StatefulWidget {
  const Example({
    Key? key,
  }) : super(key: key);

  @override
  State<Example> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<Example> {
  final AppinioSwiperController appinioSwiperController =
      AppinioSwiperController();
  final controller = Get.find<IntroController>();

  List<ExampleCard> cards = [];

  @override
  void initState() {
    _loadCards();
    super.initState();
  }

  void _loadCards() {
    for (ExampleCandidateModel candidate in candidates) {
      cards.add(
        ExampleCard(
          candidate: candidate,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Column(
          children: [
            skipButton(appinioSwiperController),
            Expanded(
                child: AppinioSwiper(
              unlimitedUnswipe: true,
              isDisabled: controller.cardIndex.value == 1,
              controller: appinioSwiperController,
              unswipe: _unswipe,
              cards: cards,
              onSwipe: _swipe,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 40,
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(20),
                swipeLeftButton(appinioSwiperController),
                Expanded(
                    child: SizedBox(
                        height: 10,
                        child: Obx(() => AnimatedAlign(
                              duration: const Duration(milliseconds: 150),
                              alignment: controller.cardIndex.value == 3
                                  ? Alignment.centerLeft
                                  : Alignment.center,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Obx(() => AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 100),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        height: 15,
                                        width: controller.cardIndex.value ==
                                                3 - index
                                            ? 25
                                            : 10,
                                        decoration: BoxDecoration(
                                            color: controller.cardIndex.value ==
                                                    3 - index
                                                ? const Color(0xFF7485EE)
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ));
                                },
                              ),
                            )))),
                swipeRightButton(appinioSwiperController),
                const Gap(20),
              ],
            ),
            const Gap(20)
          ],
        ),
      ),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    if (controller.cardIndex.value == 1) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      controller.cardIndex.value = index;
    }
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      Get.find<IntroController>().cardIndex.value += 1;
    }
  }
}

class ExampleCard extends StatelessWidget {
  final ExampleCandidateModel candidate;

  const ExampleCard({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: candidate.color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: CupertinoColors.white,
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(20),
            SizedBox(
                height: Get.height * 0.3, child: Image.asset(candidate.image)),
            const Gap(50),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 10),
                child: AutoSizeText(
                  candidate.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AutoSizeText(
                  candidate.content,
                  textAlign: TextAlign.center,
                  minFontSize: 12,
                  maxFontSize: 12,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.9)),
                ),
              ),
            )
          ],
        ));
  }
}

class ExampleCandidateModel {
  String title;
  String content;
  String image;
  LinearGradient? color;

  ExampleCandidateModel({
    required this.title,
    required this.content,
    required this.image,
    required this.color,
  });
}

List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    title: 'Learn sign language the easy way',
    content: 'Learn sign language easily through videos and hands-on practice',
    image: Assets.image.intro3.path,
    color: gradientBlue,
  ),
  ExampleCandidateModel(
    title: 'Support the deaf to access information',
    content: 'Articles, videos, text images translated into sign language',
    image: Assets.image.intro2.path,
    color: gradientBlue,
  ),
  ExampleCandidateModel(
    title: 'The best way to communicate with the deaf',
    content:
        'Supports conversion from voice/text to sign language and vice versa',
    image: Assets.image.intro1.path,
    color: gradientBlue,
  ),
];

const LinearGradient gradientBlue = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFC2E9FB),
    Color(0xFF5BBBE1),
    Color(0xFF4E65FF),
  ],
);

class ExampleButton extends StatelessWidget {
  final Function onTap;
  final Widget child;

  const ExampleButton({
    required this.onTap,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: child,
    );
  }
}

//swipe card to the right side
Widget swipeRightButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () {
      Get.find<IntroController>().cardIndex.value == 1
          ? Get.offAllNamed(Routes.LOGIN)
          : controller.swipeRight();
    },
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: CupertinoColors.activeGreen,
        gradient: gradientBlue,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.activeGreen.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.arrow_forward_rounded,
        color: CupertinoColors.white,
        size: 40,
      ),
    ),
  );
}

//swipe card to the left side
Widget swipeLeftButton(AppinioSwiperController controller) {
  return ExampleButton(
      onTap: () => controller.unswipe(),
      child: Obx(
        () => SizedBox(
            height: 60,
            width: Get.find<IntroController>().cardIndex.value == 3 ? 0 : 60,
            child: AnimatedOpacity(
              opacity: Get.find<IntroController>().cardIndex.value == 3 ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: CupertinoColors.black,
                size: 40,
              ),
            )),
      ));
}

//skip intro
Widget skipButton(AppinioSwiperController controller) {
  return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Get.offAllNamed(Routes.LOGIN),
        child: const Text(
          'Skip',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ));
}
