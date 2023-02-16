import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_card.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF172038),
        child: SafeArea(
          child: Column(
            children: [
              const InfoCard(
                name: "Ogunfowokan Boluwatife",
                profession: "Programmer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
