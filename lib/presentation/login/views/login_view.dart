import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:magic_sign/gen/assets.gen.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  CustomAnimationControl control = CustomAnimationControl.play;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
              height: Get.height * 0.25,
              child: CustomAnimation<double>(
                duration: const Duration(milliseconds: 500),
                control: control, // bind state variable to parameter
                tween: Tween(begin: -100.0, end: 100.0),
                builder: (context, child, value) {
                  return Transform.translate(
                    // animation that moves childs from left to right
                    offset: Offset(0, value),
                    child: child,
                  );
                },
                child: const Text(
                  'Welcome,\nSign up to continue!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                CustomAnimation<double>(
                  duration: const Duration(milliseconds: 1000),
                  control: control, // bind state variable to parameter
                  tween: Tween(begin: -100.0, end: 0),
                  builder: (context, child, value) {
                    return Transform.translate(
                      // animation that moves childs from left to right
                      offset: Offset(value, 0),
                      child: child,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email or Phone number",
                                prefixIcon: const Icon(CupertinoIcons.mail),
                                contentPadding: const EdgeInsets.only(top: 15),
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                prefixIcon: const Icon(CupertinoIcons.lock),
                                contentPadding: const EdgeInsets.only(top: 15),
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1)),
                        ))),
                const Gap(30),
                IntrinsicWidth(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color(0xFF4E65FF),
                              Color(0xFF5BBBE1),
                            ])),
                        child: const Center(
                          child: Text("LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 1,
                              color: Colors.black,
                            ),
                            const Gap(5),
                            const Text("OR",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            const Gap(5),
                            Container(
                              width: 30,
                              height: 1,
                              color: Colors.black,
                            ),
                          ],
                        )
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFCE0E2D)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(Assets.svg.huaweiLogo, width: 35),
                            const Gap(8),
                            const Text("Sign in with HUAWEI ID",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(120),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(143, 148, 251, 1))),
                      TextSpan(
                        text: 'Sign up',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromRGBO(143, 148, 251, 1)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
