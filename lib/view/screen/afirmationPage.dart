import 'package:afirmation/bLogic/afirmacionProvider/afirmacionProvider.dart';
import 'package:afirmation/bLogic/platform/platformProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AfirmationPage extends StatefulWidget {
  const AfirmationPage({super.key});

  @override
  State<AfirmationPage> createState() => _AfirmationPageState();
}

class _AfirmationPageState extends State<AfirmationPage> {
  @override
  void initState() {
    PlatformContext.context = context;
    PlatformProvider platformProvider = context.read<PlatformProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      platformProvider.genderWindow();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AfirmacionProvider afirmProv = context.watch<AfirmacionProvider>();
    return PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: afirmProv.widget.length,
        controller: AfirmacionProvider.pageController,
        onPageChanged: (index) {
          if (index == 1) {
            afirmProv.hiddenSwipeButton();
          }
          if (index == 10) {}
        },
        itemBuilder: (context, index) {
          return afirmProv.widget[index];
        });
  }
}
