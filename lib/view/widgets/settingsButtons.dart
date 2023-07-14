import 'package:flutter/material.dart';

class SettingsButtonWidget extends StatelessWidget {
  const SettingsButtonWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.onClick});
  final Image icon;
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final onClick;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 18,
              child: icon,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xff28103E),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/icons/notifRightArrow.png',
              width: 8,
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}
