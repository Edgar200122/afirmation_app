import 'package:afirmation/view/screen/testPage.dart';
import 'package:afirmation/view/widgets/headerButton.dart';
import 'package:flutter/material.dart';

class PassTheTest extends StatelessWidget {
  const PassTheTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 110,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Привіт!',
            style: TextStyle(
              color: Color(0xffC4C2D2),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          const Text(
            'Тут ще немає жодного пройденого',
            style: TextStyle(
              color: Color(0xffC4C2D2),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          const Text(
            'тесту тобою. Не втрачай час та',
            style: TextStyle(
              color: Color(0xffC4C2D2),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          const Text(
            'дізнайся більше про себе - пройди',
            style: TextStyle(
              color: Color(0xffC4C2D2),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          const Text(
            'перший тест вже зараз!',
            style: TextStyle(
              color: Color(0xffC4C2D2),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
            ),
            child: HeaderButtonWidget(
              text: 'Пройти тест',
              onClick: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const TestProviderPage(),
                    transitionDuration: const Duration(milliseconds: 450),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/testImage.png',
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class PassTheTestAgain extends StatelessWidget {
  const PassTheTestAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 110,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Привіт!',
            style: TextStyle(
              color: Color(0xffC4C2D2),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          const Text(
            'Твій попередній тест закінчився.',
            style: TextStyle(
              color: Color(0xffC4C2D2),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          const Text(
            'Ти набрав/ла',
            style: TextStyle(
              color: Color(0xffC4C2D2),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
            ),
            child: HeaderButtonWidget(
              text: 'Пройти тест знову',
              onClick: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const TestProviderPage(),
                    transitionDuration: const Duration(milliseconds: 450),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/testImage.png',
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
