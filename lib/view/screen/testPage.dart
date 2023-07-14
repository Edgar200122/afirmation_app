import 'package:afirmation/bLogic/testProv/testProv.dart';
import 'package:afirmation/view/platformForPage.dart';
import 'package:afirmation/view/widgets/headerButton.dart';
import 'package:afirmation/view/widgets/testBlockWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestProviderPage extends StatelessWidget {
  const TestProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TestProvider(),
      child: const TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    TestProvider testProvider = context.watch<TestProvider>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(
                  vertical: 23,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(224, 224, 224, 0.63),
                        spreadRadius: 3,
                        blurRadius: 5),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const PlatformPageWithProvider(),
                              transitionDuration:
                                  const Duration(milliseconds: 450),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Image.asset(
                              'assets/icons/notifRightArrow.png',
                              width: 14,
                              height: 8,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(),
                        child: FittedBox(
                          child: Text(
                            '${testProvider.part}/10',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff28103E),
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        alignment: Alignment.centerRight,
                        child: Text(
                          '(${testProvider.showingChoosingBal} балів)',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: testProvider.showingChoosingBal > 0
                                ? const Color(0xff7D2DC5)
                                : const Color(0xffC4C2D2),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 20,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 105,
                    child: Text(
                      testProvider.data[testProvider.part - 1]['Question'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff28103E),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Wrap(
                direction: Axis.vertical,
                runSpacing: 15,
                children: List.generate(4, (index) {
                  return TestBlocWidget(index: index);
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                ),
                child: HeaderButtonWidget(
                  onClick: () {
                    if (testProvider.nextButtonState) {
                      if (testProvider.part == 10) {
                        testProvider.countingPercent(context);
                      } else {
                        testProvider.nextPart();
                      }
                    } else {}
                  },
                  text: 'Наступне питання',
                  activeOrNot: testProvider.nextButtonState,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
