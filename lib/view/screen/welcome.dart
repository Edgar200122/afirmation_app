import 'package:afirmation/view/screen/choosingPage.dart';
import 'package:afirmation/view/widgets/headerButton.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/welcomeImage.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    Column(
                      children: const [
                        Text(
                          'Привіт!',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff28103E),
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Ми — ті, хто допоможе тобі',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff28103E),
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'в тяжкі хвилини',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff28103E),
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: const [
                        Text(
                          'В нашому додатку ти завжди',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff28103E),
                            // fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'отримаешь пiдтримку!',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff28103E),
                            // fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: HeaderButtonWidget(
                        text: 'Продовжити',
                        onClick: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const OnBoardingProvider(),
                              transitionDuration:
                                  const Duration(milliseconds: 450),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
