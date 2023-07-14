import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget(
      {super.key,
      this.share = true,
      this.arrow = false,
      this.text = '',
      required this.onclickShare,
      required this.arrowOnclick});
  final bool share;
  final bool arrow;
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final onclickShare;
  // ignore: prefer_typing_uninitialized_variables
  final arrowOnclick;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 3,
                ),
                child: arrow
                    ? GestureDetector(
                        onTap: arrowOnclick,
                        child: Container(
                          width: 45,
                          height: 45,
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(0),
                          child: Center(
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
                      )
                    : const SizedBox(),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(),
                child: FittedBox(
                  child: Text(
                    text,
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
              child: share
                  ? GestureDetector(
                      onTap: onclickShare,
                      child: Image.asset(
                        'assets/icons/shareIcon.png',
                        width: 21,
                        height: 17,
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
