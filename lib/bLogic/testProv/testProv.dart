import 'dart:ui';

import 'package:afirmation/bLogic/platform/platformProvider.dart';
import 'package:afirmation/view/platformForPage.dart';
import 'package:flutter/material.dart';

class TestProvider extends ChangeNotifier {
  int part = 1;
  bool nextButtonState = false;
  int showingChoosingBal = 0;
  int selectedPoints = 0;

  List<Map> data = [
    {
      'Question': 'Що для вас гроші?',
      'numberQuestion': '1',
      'answerBloc': [
        {
          'numberAnswer': 'А',
          'answer': 'Щастя',
          'points': '2',
          'pushState': false
        },
        {
          'numberAnswer': 'Б',
          'answer': 'Головний біль',
          'points': '1',
          'pushState': false
        },
        {
          'numberAnswer': 'В',
          'answer': 'Бумажки',
          'points': '0',
          'pushState': false
        },
        {
          'numberAnswer': 'Г',
          'answer': 'Моє все',
          'points': '3',
          'pushState': false
        },
      ],
    },
    {
      'Question': 'Що ви думаєте про гроші?',
      'numberQuestion': '2',
      'answerBloc': [
        {
          'numberAnswer': 'А',
          'answer': 'Гроші можуть покращити\nмоє життя',
          'points': '1',
          'pushState': false
        },
        {
          'numberAnswer': 'Б',
          'answer': 'Достаток грошей робить\nмене вільним',
          'points': '2',
          'pushState': false
        },
        {
          'numberAnswer': 'В',
          'answer': 'Гроші здійснюють мрії',
          'points': '3',
          'pushState': false
        },
        {
          'numberAnswer': 'Г',
          'answer': 'Гроші псують людей',
          'points': '0',
          'pushState': false
        },
      ],
    },
    {
      'Question': 'Мої фінанси:',
      'numberQuestion': '3',
      'answerBloc': [
        {
          'numberAnswer': 'А',
          'answer': 'Співають романси',
          'points': '3',
          'pushState': false
        },
        {
          'numberAnswer': 'Б',
          'answer': 'Завжди пусті кармани',
          'points': '2',
          'pushState': false
        },
        {
          'numberAnswer': 'В',
          'answer': 'З грошима все добре',
          'points': '1',
          'pushState': false
        },
        {
          'numberAnswer': 'Г',
          'answer': 'Щомісяця рахую дні до зарплатні',
          'points': '0',
          'pushState': false
        },
      ],
    },
    {
      'Question': 'Як я можу стати богатим?',
      'numberQuestion': '4',
      'answerBloc': [
        {
          'numberAnswer': 'А',
          'answer': 'Відкриюсь для\nгрошей енергетично',
          'points': '2',
          'pushState': false
        },
        {
          'numberAnswer': 'Б',
          'answer': 'Багато працювати на знос',
          'points': '0',
          'pushState': false
        },
        {
          'numberAnswer': 'В',
          'answer': 'Відкладати 10% зарплатні',
          'points': '1',
          'pushState': false
        },
        {
          'numberAnswer': 'Г',
          'answer': 'Довіритись Всесвіту та\nстати магнітом для грошей',
          'points': '3',
          'pushState': false
        },
      ],
    },
    {
      'Question':
          'Чи готові ви змінити свої\nзвички, щоб отримати\nбільше грошей у своє життя?',
      'numberQuestion': '5',
      'answerBloc': [
        {
          'numberAnswer': 'А',
          'answer': 'Так, я готовий змінюватись',
          'points': '3',
          'pushState': false
        },
        {
          'numberAnswer': 'Б',
          'answer': 'Так, але у певній мірі',
          'points': '2',
          'pushState': false
        },
        {
          'numberAnswer': 'В',
          'answer': 'Ні, я занадто звик\nдо своїх звичок',
          'points': '1',
          'pushState': false
        },
        {
          'numberAnswer': 'Г',
          'answer': 'Мені і так нормально',
          'points': '0',
          'pushState': false
        },
      ],
    },
    {
      'Question':
          'Чи відкриті ви до можливостей\nзаробітку грошей, які не\nвимагають від вас додаткових\nзусиль або знань?',
      'numberQuestion': '6',
      'answerBloc': [
        {
          'numberAnswer': 'А',
          'answer': 'Я відкритий для нового',
          'points': '3',
          'pushState': false
        },
        {
          'numberAnswer': 'Б',
          'answer': 'Так, але з певними обмеженнями',
          'points': '2',
          'pushState': false
        },
        {
          'numberAnswer': 'В',
          'answer': 'Ні, я не хочу змінювати своє життя',
          'points': '1',
          'pushState': false
        },
        {
          'numberAnswer': 'Г',
          'answer': 'Я не вірю у це',
          'points': '0',
          'pushState': false
        },
      ],
    },
    {
      'Question':
          'Я не боюся мати більше\nгрошей, навіть якщо\nце може змінити моє життя',
      'numberQuestion': '7',
      'answerBloc': [
        {
          'numberAnswer': 'А',
          'answer': 'Абсолютно про мене',
          'points': '1',
          'pushState': false
        },
        {
          'numberAnswer': 'Б',
          'answer': 'Відчуваю, що це правда',
          'points': '2',
          'pushState': false
        },
        {
          'numberAnswer': 'В',
          'answer': 'Не впевнений',
          'points': '0',
          'pushState': false
        },
        {
          'numberAnswer': 'Г',
          'answer': 'Я не боюся великих грошей',
          'points': '3',
          'pushState': false
        },
      ],
    },
    {
      'Question': 'Як ви отримаєте гроші?',
      'numberQuestion': '8',
      'answerBloc': [
        {
          'numberAnswer': 'А',
          'answer': 'Любою ціною',
          'points': '1',
          'pushState': false
        },
        {
          'numberAnswer': 'Б',
          'answer': 'Щомісяця зарплатня',
          'points': '2',
          'pushState': false
        },
        {
          'numberAnswer': 'В',
          'answer': 'Як подарунок від Всесвіту',
          'points': '3',
          'pushState': false
        },
        {
          'numberAnswer': 'Г',
          'answer': 'Мені соромно брати\nгроші за свою роботу',
          'points': '0',
          'pushState': false
        },
      ],
    },
    {
      'Question': 'Що тобі треба змінити в\nзвичках щоб бути багатим?',
      'numberQuestion': '9',
      'answerBloc': [
        {
          'numberAnswer': 'А',
          'answer': 'Позбутися мислення бідняка',
          'points': '1',
          'pushState': false
        },
        {
          'numberAnswer': 'Б',
          'answer': 'Припинити завжди\nдумати про грощі',
          'points': '2',
          'pushState': false
        },
        {
          'numberAnswer': 'В',
          'answer': 'Не дивитися на цінники в магазині',
          'points': '0',
          'pushState': false
        },
        {
          'numberAnswer': 'Г',
          'answer': 'Вірити в закон енергії грошей',
          'points': '3',
          'pushState': false
        },
      ],
    },
    {
      'Question': 'Скільки грошей вам потрібно\nдля полного щастя?',
      'numberQuestion': '10',
      'answerBloc': [
        {
          'numberAnswer': 'А',
          'answer': 'Мільйон доларів',
          'points': '1',
          'pushState': false
        },
        {
          'numberAnswer': 'Б',
          'answer': 'Всі гроші планети',
          'points': '3',
          'pushState': false
        },
        {
          'numberAnswer': 'В',
          'answer': 'Більше, ніж у Елона Маска',
          'points': '2',
          'pushState': false
        },
        {
          'numberAnswer': 'Г',
          'answer': 'Мені вистачає',
          'points': '0',
          'pushState': false
        },
      ],
    }
  ];

  List<Map> result = [
    {
      'successOrFailure': 'Вітаємо!',
      'text': const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Ви – справжній фінансовий гуру, який притягує гроші до свого життя як магніт. Людям є чому у Вас повчитися. Але…Чи справді Вам комфортно? Чи не вважаєте, що насправді гідні більшого? Здаться, у Вас ще залишився той фінансовий блок, що заважає стати мільонером.',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xff28103E),
            fontSize: 14,
          ),
        ),
      ),
    },
    {
      'successOrFailure': 'Вітаємо!',
      'text': const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Виглядає так, що у Вас не все добре з грошима. Завжди коли Ви намагалися збільшити свій дохід, результат завжди залишався незмінним.Це тому, що Ви підсідомо блокуєте надходження грошей! Подумайте над цим та дозвольте великим фінансам увійти до Вашого життя!',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xff28103E),
            fontSize: 14,
          ),
        ),
      ),
    },
  ];

  void chooseAnswer(int choosingNumber) {
    for (int i = 0; i < data[part - 1]['answerBloc'].length; i++) {
      data[part - 1]['answerBloc'][i]['pushState'] = false;
    }
    data[part - 1]['answerBloc'][choosingNumber]['pushState'] = true;
    selectedPoints =
        int.parse(data[part - 1]['answerBloc'][choosingNumber]['points']);
    nextButtonState = true;
    notifyListeners();
  }

  void countingPercent(BuildContext context) async {
    showingChoosingBal += selectedPoints;
    double howManyPercentOnePoint = 100 / 30;
    int percentResult = (howManyPercentOnePoint * showingChoosingBal).toInt();

    showDialog<String>(
      context: context,
      barrierColor: const Color.fromRGBO(233, 233, 233, 0.63),
      builder: (BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 140,
                width: MediaQuery.of(context).size.width,
                child: Dialog(
                  insetPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.white,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const PlatformPageWithProvider(),
                                transitionDuration:
                                    const Duration(milliseconds: 450),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Image.asset(
                                'assets/icons/notDialogClose.png',
                                width: 14,
                                height: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: Text(
                          percentResult > 70 ? 'Вітаємо!' : 'Невдача!',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff28103E),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: Text(
                          'Ти набрав/ла',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff28103E),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        '${percentResult.toString()}%',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff7D2DC5),
                          fontSize: 48,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          percentResult <= 59

                              // failure
                              ? 'Ви відповіли на всі запитання гри, проте виглядає так, що у Вас не все добре з грошима. Можливо, вони відсутні в Вашому житті, або ж їх недостатньо. Незалежно від того, як Ви намагалися збільшити свій дохід, результат завжди залишався незмінним.Що, на Вашу думку, може бути причиною такої ситуації?Це тому, що Ви підсідомо блокуєте надходження грошей в своє життя, або не вмієте їх приймати. Тож, подумайте над цим та дозвольте великим фінансам увійти до Вашого життя!'
                              //succesful
                              : 'Вітаємо! Ви – справжній фінансовий гуру, який притягує гроші до свого життя як магніт. Людям є чому у Вас повчитися. Але…Чи справді Вам комфортно? Хіба Ви почуваєтесь так, ніби це – Ваша фінансова стеля? Чи не вважаєте, що насправді гідні більшого?  Здаться, у Вас ще залишився той фінансовий блок, що заважає стати мільонером. Ви точно нічим не гірщі, аніж бізнесмени зі сторінок Форбс. Тож, обміркуйте це та впустіть дійсно великі гроші до Вашого життя!',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff28103E),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 28,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  PageIndex.indexPage = 0;
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const PlatformPageWithProvider(),
                                      transitionDuration:
                                          const Duration(milliseconds: 450),
                                      transitionsBuilder: (_, a, __, c) =>
                                          FadeTransition(opacity: a, child: c),
                                    ),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    // horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xff7D2DC5),
                                    ),
                                  ),
                                  child: const Text(
                                    'На головну',
                                    style: TextStyle(
                                      color: Color(0xff7D2DC5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  clearTestingState();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    // horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff7D2DC5),
                                  ),
                                  child: const Text(
                                    'Пройти заново',
                                    style: TextStyle(
                                      color: Color(0xffF9F9F9),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void clearTestingState() {
    showingChoosingBal = 0;
    selectedPoints = 0;
    nextButtonState = false;
    part = 1;
    for (int i = 0; i < data.length; i++) {
      for (int e = 0; e < data[i]['answerBloc'].length; e++) {
        data[i]['answerBloc'][e]['pushState'] = false;
      }
    }
    notifyListeners();
  }

  void nextPart() {
    showingChoosingBal += selectedPoints;
    part += 1;
    nextButtonState = false;
    notifyListeners();
  }
}
