import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  late SMIBool searchTrigger;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8),
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              )),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  searchTrigger.change(true);
                },
                child: SizedBox(
                  height: 36,
                  width: 36,
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/icons.riv",
                    artboard: "SEARCH",
                    onInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName: "SEARCH_Interactivity");

                      searchTrigger = controller.findSMI("active") as SMIBool;
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat",
  )
];
