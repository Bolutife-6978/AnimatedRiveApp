import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'components/anmiated_btn.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      // to stop button animation when hot restarting.
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //Background animation
        Positioned(
            //height: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png")),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 10,
            ),
          ),
        ),
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 30,
              sigmaY: 30,
            ),
            child: const SizedBox(),
          ),
        ),
        //Text
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              SizedBox(
                width: 260,
                child: Column(
                  children: const [
                    Text(
                      "Learn design & code",
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: "Poppins",
                        height: 1.2,
                      ),
                    ),
                    Text(
                        "Don't skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best courses.")
                  ],
                ),
              ),
              //Animated button
              const Spacer(
                flex: 2,
              ),
              AnimatedBtn(
                btnAnimationController: _btnAnimationController,
                press: () {
                  _btnAnimationController.isActive = true;
                  showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: "Sign In",
                    context: context,
                    pageBuilder: (context, _, __) => Center(
                      child: Container(
                        height: 620,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  "Purchase includes access to30+ courses, 240+ premium tutorial,120+ hours ofvideos,source files and certificates.",
                ),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
