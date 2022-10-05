import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:huawei_ml_language/huawei_ml_language.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFF1EFEF),
          // body: ARS(),
          body: ListView(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
            children: [
              const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://res.cloudinary.com/practicaldev/image/fetch/s--T0YOJuAU--/c_imagga_scale,f_auto,fl_progressive,h_900,q_auto,w_1600/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/durv8e5fj4qqlxbdxzxl.jpg',
                  ),
                ),
              ),
              const Gap(15),
              const Center(
                child: Text('Hoang Minh Tam',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.black)),
              ),
              const Gap(50),
              _information(title: 'Name', content: 'Hoang Minh Tam', icon: Icons.person),
              _information(title: 'Email', content: 'Hoang Minh Tam', icon: Icons.mail),
              _information(title: 'Password', content: 'Hoang Minh Tam', icon: Icons.lock),
              _information(title: 'Phone number', content: 'Hoang Minh Tam', icon: Icons.phone_android),
              _information(title: 'Privacy policy', content: 'Hoang Minh Tam', icon: Icons.privacy_tip_rounded, edit: false),
              const Gap(50),
              logoutButton()
            ],
          )
      ),
    );
  }
}

Widget _information({
  required String title,
  required String content,
  required IconData icon,
  bool edit = true}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Icon(icon, color: const Color(0xFF4C6ED7)),
              ),
              const Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black)),
                  const Gap(8),
                  Text(content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black54)),
                ],
              )
            ],
          ),
        ),
        TextButton(
            onPressed: () {},
            child: edit?
            const Text('Edit'):
            const Icon(Icons.navigate_next_rounded)
        )
      ],
    ),
  );
}

Widget logoutButton(){
  return InkWell(
    onTap: (){},
    child: Container(
      padding: const EdgeInsets.symmetric(
          vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            Color(0xFF4E65FF),
            Color(0xFF5BBBE1),
          ])),
      child: const Center(
        child: Text("LOGOUT",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
      ),
    ),
  );
}

class ARS extends StatefulWidget {
  const ARS({Key? key}) : super(key: key);

  @override
  State<ARS> createState() => _ARSState();
}

class _ARSState extends State<ARS> {

  MLAsrRecognizer recognizer =  MLAsrRecognizer();
  final setting = MLAsrSetting(
    language: MLAsrConstants.LAN_EN_US,
    feature: MLAsrConstants.FEATURE_WORDFLUX,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () async {
          String? value = await recognizer.startRecognizingWithUi(setting);
          print('zzzzzzzzzzzzzzzzzzzzz..........');
          print(value??'buzz');
          Fluttertoast.showToast(msg: "You say $value");
          print('zzzzzzzzzzzzzzzzzzzzz..........');
        },
        icon: const Icon(Icons.mic),
      ),
    );
  }
}

