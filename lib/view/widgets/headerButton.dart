import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderButtonWidget extends StatelessWidget {
  HeaderButtonWidget(
      {super.key, required this.text, this.activeOrNot = true, this.onClick});
  final String text;
  final bool activeOrNot;
  // ignore: prefer_typing_uninitialized_variables
  var onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color:
              activeOrNot ? const Color(0xff7D2DC5) : const Color(0xffEEEEF0),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color:
                activeOrNot ? const Color(0xffF9F9F9) : const Color(0xffC4C2D2),
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
