import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Notificationbutton extends StatelessWidget {
  Notificationbutton({
    super.key,
    required this.onClick,
    required this.text,
    required this.number,
  });
  // ignore: prefer_typing_uninitialized_variables
  var onClick;
  final String text;
  final String number;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(
          top: 14,
          bottom: 14,
          left: 10,
          right: 19,
        ),
        margin: const EdgeInsets.only(
          right: 16,
          left: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffF8F8FC),
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color(0xff28103E),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 28,
                  ),
                  child: Text(
                    number,
                    style: const TextStyle(
                      color: Color(0xff28103E),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Image.asset(
                  'assets/icons/notifRightArrow.png',
                  width: 8,
                  height: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
