import 'dart:async';
import 'package:afirmation/bLogic/localStorage/initShared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AfirmacionProvider extends ChangeNotifier {
  AfirmacionProvider() {
    getSwipeData();
    animatedStart();
  }
  void getSwipeData() {
    swipeHidden = SharedPreferencesCustom.prefs
            .getBool('DataForFirstJoinAfirmationPage') ??
        true;
  }

  Timer? arrowAnimatedTimer;
  static PageController pageController = PageController();
  bool swipeHidden = true;
  bool arrowAnimated = false;
  final List<Widget> widget = [
    const AfirmationPageWidget(
      text1: 'Гроші приходять у моє життя\nудосталь, легко і часто',
      text2:
          '"Гроші - це не все, але їх вистачить\nна все, що потрібно." - Генрі Форд.',
      image: 'assets/images/afirmPhoto1.png',
    ),
    const AfirmationPageWidget(
      text1: 'Я контролюю гроші, гроші не\n контролюють мене',
      text2:
          '"Гроші - це можливість\nздійснюватисвої мрії. Не\nбійтесь мріяти велико."\n - Хлоя Каплін.',
      image: 'assets/images/pexels-karolina-grabowska-4968669 1.png',
    ),
    const AfirmationPageWidget(
      text1: 'Я фінансово забезпечена\nлюдина',
      text2:
          '"Гроші можуть змінити ваше\nжиття, якщо ви дійсно хочете\nцього." - Ребекка Паркер.',
      image: 'assets/images/cayley-nossiter-LO3IuL-wgME-unsplash 1.png',
    ),
    const AfirmationPageWidget(
      text1: 'Я контролюю гроші, гроші не\n контролюють мене',
      text2:
          '"Гроші - це можливість здійснювати\nсвої мрії. Не бійтесь мріяти велико."\n - Хлоя Каплін.',
      image: 'assets/images/daria-pimkina-Dj5HnHMtkH0-unsplash 1.png',
    ),
    const AfirmationPageWidget(
      text1: 'Немає жодних обмежень на\nкількість грошей, які я можу\nмати',
      text2:
          '"Фінансова свобода - це не про те,\nщоб мати все, а про те, щоб не\nзалежати від нікого”. -  Тоні Роббінс.',
      image: 'assets/images/emre-aliriz-2rhz3Nuq12c-unsplash 1.png',
    ),
    const AfirmationPageWidget(
      text1: 'Я відкритий для отримання\nбагатства численними\nканалами',
      text2:
          '"Щоб бути успішним в житті,\nпотрібно знати, як управляти\nгрошима." - Бенджамін Франклін.',
      image:
          'assets/images/happy-subordinates-giving-high-five-after-successfully-undertaking-new-project-boardroom 1.png',
    ),
    const AfirmationPageWidget(
      text1: "Я відпускаю занепокоєння\nпов'язане з моїми фінансами",
      text2:
          '"Не бійтеся великих грошей, бо вони\nдопоможуть вам реалізувати ваші\nмрії та бажання.” - Брайан Трейсі.',
      image: 'assets/images/pexels-karolina-grabowska-6328894 1.png',
    ),
    const AfirmationPageWidget(
      text1:
          "Я настільки забезпечений у\nфінансовому плані що\nзабуваю коли приходить\nдень зарплати",
      text2:
          '"Гроші - це свобода, але не\nзабувайте, що свобода - це не лише\nгроші." - Дейвід Айк.',
      image: 'assets/images/pexels-karolina-grabowska-4968648 1.png',
    ),
    const AfirmationPageWidget(
      text1: 'Гроші течуть до мене як вода',
      text2:
          '"Гроші - це велика відповідальність,\nале вони також дають великі\nможливості." - Джон Рокфеллер.',
      image: 'assets/images/pexels-antoni-shkraba-5292266 1.png',
    ),
    GestureDetector(
      onHorizontalDragUpdate: (e) {
        if (e.delta.dx < 0) {
          AfirmacionProvider.pageController.animateTo(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }
      },
      child: const AfirmationPageWidget(
        text1: "Я буду першим мільйонером\nу своїй сім'ї",
        text2:
            '"Багатство - це можливість мати\nбільше вибору та свободи в житті."\n- Ілон Маск.',
        image: 'assets/images/pexels-karolina-grabowska-5882683 1.png',
      ),
    ),
  ];
  void hiddenSwipeButton() async {
    swipeHidden = false;
    SharedPreferencesCustom.prefs
        .setBool('DataForFirstJoinAfirmationPage', false);
    arrowAnimatedTimer!.cancel();
    notifyListeners();
  }

  void animatedStart() {
    arrowAnimatedTimer = Timer.periodic(
        const Duration(
          milliseconds: 600,
        ), (timer) {
      arrowAnimated = !arrowAnimated;
      notifyListeners();
    });
  }
}

class AfirmationPageWidget extends StatelessWidget {
  const AfirmationPageWidget(
      {super.key,
      required this.text1,
      required this.text2,
      required this.image,
      this.pageController});

  final String text1;
  final String text2;
  final String image;
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    AfirmacionProvider afirmProv = context.watch<AfirmacionProvider>();
    return Container(
      margin: const EdgeInsets.only(
        top: 70,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 150,
          ),
          Text(
            text1,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xffF9F9F9),
              fontFamily: 'Poppins',
              fontSize: 19,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            text2,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xffF9F9F9),
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 105,
          ),
          afirmProv.swipeHidden
              ? Center(
                  child: Container(
                    width: 142,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F3FB),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: const Color(0xffF3F3FB),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 35,
                          child: AnimatedAlign(
                            alignment: afirmProv.arrowAnimated
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            duration: const Duration(
                              milliseconds: 600,
                            ),
                            child: Image.asset(
                              'assets/icons/swipeArrow.png',
                              width: 13,
                              height: 11,
                            ),
                          ),
                        ),
                        const Text(
                          'Swipe',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffC4C2D2),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 14,
                  ),
                  child: const Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xffC4C2D2),
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
