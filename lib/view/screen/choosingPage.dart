import 'package:afirmation/bLogic/onBording/onBoardingProvider.dart';
import 'package:afirmation/view/screen/addNotificationPage.dart';
import 'package:afirmation/view/widgets/choosingButton.dart';
import 'package:afirmation/view/widgets/headerButton.dart';
import 'package:afirmation/view/widgets/skipWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingProvider extends StatelessWidget {
  const OnBoardingProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingProviderClass(),
      child: const ChoosingPage(),
    );
  }
}

class ChoosingPage extends StatelessWidget {
  const ChoosingPage({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingProviderClass onBoardingProviderClass =
        context.watch<OnBoardingProviderClass>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SkipWidget(
            onClick: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const NotProvider(),
                  transitionDuration: const Duration(seconds: 1),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 42,
              bottom: 20,
            ),
            child: Column(
              children: const [
                Text(
                  'Яка підтримка тобі',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff28103E),
                    fontSize: 24,
                  ),
                ),
                Text(
                  'необхідна?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff28103E),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            runSpacing: 15,
            children: List.generate(
                onBoardingProviderClass.needSupportQuestions.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(
                  right: 12,
                ),
                child: GestureDetector(
                  onTap: () {
                    onBoardingProviderClass.choosingAnswer(index);
                  },
                  child: ChoosingButtonWidget(
                    text: onBoardingProviderClass.needSupportQuestions[index]
                        ['name'],
                    index: index,
                    onBoardingProviderClass: onBoardingProviderClass,
                  ),
                ),
              );
            }),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: HeaderButtonWidget(
              text: 'Продовжити',
              activeOrNot: onBoardingProviderClass.buttonActiveOrNot,
              onClick: () {
                if (onBoardingProviderClass.buttonActiveOrNot) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const NotProvider(),
                      transitionDuration: const Duration(seconds: 1),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                }
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
