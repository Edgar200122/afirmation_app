import 'package:afirmation/bLogic/testProv/testProv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestBlocWidget extends StatelessWidget {
  const TestBlocWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    TestProvider testProvider = context.watch<TestProvider>();
    return GestureDetector(
      onTap: () {
        testProvider.chooseAnswer(index);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width - 32,
        height: 64,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        margin: const EdgeInsets.only(
          top: 7,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 234, 234, 241),
          borderRadius: BorderRadius.circular(
            5,
          ),
          border: Border.all(
            width: 2,
            color: testProvider.data[testProvider.part - 1]['answerBloc'][index]
                    ['pushState']
                ? const Color(0xff7D2DC5)
                : Colors.transparent,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 6,
              ),
              child: Text(
                '${testProvider.data[testProvider.part - 1]['answerBloc'][index]['numberAnswer']}.',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff28103E),
                  // fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 3,
                ),
                child: Text(
                  testProvider.data[testProvider.part - 1]['answerBloc'][index]
                      ['answer'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff28103E),
                    // fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
