import 'package:afirmation/bLogic/onBording/onBoardingProvider.dart';
import 'package:flutter/material.dart';

class ChoosingButtonWidget extends StatelessWidget {
  const ChoosingButtonWidget(
      {super.key,
      required this.text,
      required this.onBoardingProviderClass,
      required this.index});
  final String text;
  final OnBoardingProviderClass onBoardingProviderClass;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width / 2 - 32,
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xffF8F8FC),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2,
          color: onBoardingProviderClass.needSupportQuestions[index]
                      ['choose'] ==
                  true
              ? const Color(0xff7D2DC5)
              : Colors.transparent,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Color(0xff28103E),
          // fontFamily: 'Poppins',
          fontSize: 16,
        ),
      ),
    );
  }
}
