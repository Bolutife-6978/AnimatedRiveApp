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
              SizedBox(
                height: 36,
                width: 36,
                child: RiveAnimation.asset(
                  "assets/RiveAssets/icons.riv",
                  artboard: "HOME",
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: "SEARCH_Interactivity");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
