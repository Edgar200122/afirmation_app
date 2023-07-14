import 'dart:ui';

import 'package:afirmation/bLogic/afirmacionProvider/afirmacionProvider.dart';
import 'package:afirmation/bLogic/platform/platformProvider.dart';
import 'package:afirmation/view/widgets/topBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlatformPageWithProvider extends StatelessWidget {
  const PlatformPageWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlatformProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AfirmacionProvider(),
        ),
      ],
      child: const PlatformForPageStateFul(),
    );
  }
}

class PlatformForPageStateFul extends StatefulWidget {
  const PlatformForPageStateFul({super.key});

  @override
  State<PlatformForPageStateFul> createState() =>
      _PlatformForPageStateFulState();
}

class _PlatformForPageStateFulState extends State<PlatformForPageStateFul> {
  @override
  Widget build(BuildContext context) {
    PlatformProvider platformProvider = context.watch<PlatformProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            platformProvider.pages[PageIndex.indexPage],
            // const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 95,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/Frame 35.png',
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          platformProvider.pageChanger(2);
                        },
                        child: Container(
                          width: 55,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // top: MediaQuery.of(context).size.width * 0.07,
                      top: 26,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.142,
                          right: MediaQuery.of(context).size.width * 0.142,
                        ),
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.093,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 150,
                              ),
                              height: 2,
                              width: PageIndex.indexPage == 0 ? 32 : 0,
                              decoration: const BoxDecoration(
                                color: Color(0xff7D2DC5),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 150,
                              ),
                              height: 2,
                              width: PageIndex.indexPage == 1 ? 32 : 0,
                              decoration: const BoxDecoration(
                                color: Color(0xff7D2DC5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.15,
                          right: MediaQuery.of(context).size.width * 0.15,
                        ),
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.083,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                platformProvider.pageChanger(0);
                              },
                              child: Image.asset(
                                'assets/icons/afirmIcon.png',
                                color: PageIndex.indexPage == 0
                                    ? const Color(0xff7D2DC5)
                                    : const Color(0xff222222),
                                width: 26,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                platformProvider.pageChanger(1);
                              },
                              child: Image.asset(
                                'assets/icons/parametrIcon.png',
                                color: PageIndex.indexPage == 1
                                    ? const Color(0xff7D2DC5)
                                    : const Color(0xff222222),
                                width: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            TopBarWidget(
              text: platformProvider.topBarText,
              arrow: platformProvider.arrow,
              share: platformProvider.share,
              onclickShare: () {
                platformProvider.shareApp();
              },
              arrowOnclick: () {
                platformProvider.pageChanger(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
