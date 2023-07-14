import 'package:flutter/material.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 70,
            // padding: const EdgeInsets.symmetric(
            //   vertical: 23,
            // ),
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
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset(
                              'assets/icons/notifRightArrow.png',
                              width: 14,
                              height: 8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Умови використання',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff28103E),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 29,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 40,
              left: 16,
            ),
            child: Text(
              'Вступ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff28103E),
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  child: Text(
                    '1. ',
                    style: TextStyle(
                      color: Color(0xff28103E),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Конфіденційність користувачів нашого веб-сайту має велике значення для нас, і ми докладаємо всіх зусиль для забезпечення її захисту. Дані правила пояснюють, як ми використовуємо вашу персональну інформацію. ',
                    style: TextStyle(
                      color: Color(0xff28103E),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  child: Text(
                    '2. ',
                    style: TextStyle(
                      color: Color(0xff28103E),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Погоджуючись із використанням файлів-cookie при першому відвіданні нашого веб-сайту, відповідно до положень даних Правил, ви надаєте нам дозвіл на використання файлів-cookie при кожному вашому наступному візиті.',
                    style: TextStyle(
                      color: Color(0xff28103E),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 40,
              left: 16,
            ),
            child: Text(
              'Права інтелектуальної власності',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff28103E),
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  child: Text(
                    '1. ',
                    style: TextStyle(
                      color: Color(0xff28103E),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Погоджуючись із використанням файлів-cookie при першому відвіданні нашого веб-сайту, відповідно до положень даних Правил, ви надаєте нам дозвіл на використання файлів-cookie при кожному вашому наступному візиті.',
                    style: TextStyle(
                      color: Color(0xff28103E),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  child: Text(
                    '2. ',
                    style: TextStyle(
                      color: Color(0xff28103E),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Погоджуючись із використанням файлів-cookie при першому відвіданні нашого веб-сайту, відповідно до положень даних Правил, ви надаєте нам дозвіл на використання файлів-cookie при кожному вашому наступному візиті.',
                    style: TextStyle(
                      color: Color(0xff28103E),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
