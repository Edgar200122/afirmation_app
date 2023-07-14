import 'package:flutter/material.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({super.key, required this.onClick});
  // ignore: prefer_typing_uninitialized_variables
  final onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 3,
              top: 36,
            ),
            margin: const EdgeInsets.only(
              right: 26,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Color(0xff7D2DC5),
                ),
              ),
            ),
            child: const Text(
              'Пропустити',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff7D2DC5),
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
