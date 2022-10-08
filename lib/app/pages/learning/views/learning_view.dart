import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:magic_sign/app/routes/app_pages.dart';
import '../controllers/learning_controller.dart';

class LearningView extends GetView<LearningController> {
  const LearningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _header(),
            _divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index){
                  return course(index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


Widget _header() {
  return const Padding(
    padding: EdgeInsets.only(top: 20, bottom: 20, left: 15),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Learn sign language',
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
    ),
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

Widget course(int index){
  return Padding(
    padding: const EdgeInsets.all(15),
    child: GestureDetector(
      onTap: () {
        // Get.toNamed(Routes.NEWS_DETAIL,
        //     arguments: {'heroTag': 'hero$index', 'article': article});
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
        height: Get.width / 2.5,
        child: Row(
          children: [
            Hero(
              tag: 'hero$index',
              child: Container(
                height: Get.width / 2.5,
                width: Get.width / 2.5 ,
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
                        image: NetworkImage('https://res.cloudinary.com/h3gg/image/upload/v1632387894/Logo/logo_ig2kln.jpg'))),
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
                          '10 Chapter',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87)),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: ()=> Get.toNamed(Routes.COURSE_DETAIL, arguments: 'tag'),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black12,
                              width: 2
                            )
                          ),
                          child: const Text(
                            'View'
                          ),
                        ),
                      )
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


