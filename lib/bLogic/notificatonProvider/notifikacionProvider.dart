import 'dart:math';
import 'dart:ui';

import 'package:afirmation/bLogic/notificatonProvider/notificationService.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationProvider extends ChangeNotifier {
  bool startButtonPermission = false;
  bool finishButtonPermission = false;
  bool notActiveButton = true;
  List start = ['00', '00', '00'];
  List finish = ['00', '00', '00'];
  FixedExtentScrollController fixedExtentScrollControllerFinishour =
      FixedExtentScrollController(
    initialItem: 1,
  );
  double sliderValue = 0;
  void changePermission(String startOrFinish) {
    switch (startOrFinish) {
      case 'start':
        startButtonPermission = !startButtonPermission;
        break;
      case 'finish':
        finishButtonPermission = !finishButtonPermission;
        break;
      default:
    }
  }

  void cencel(String startOrFinish) {
    switch (startOrFinish) {
      case 'start':
        start = ['00', '00', '00'];
        break;
      case 'finish':
        finish = ['00', '00', '00'];
        break;
      default:
    }
  }

  void apply(String startOrFinish) {
    notifyListeners();
  }

  Future<void> notPermissionQuestion(BuildContext context) async {
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
                height: MediaQuery.of(context).size.height / 2.8,
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
                            Navigator.pop(context);
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
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: Text(
                          'Увімкніть доступ до повідомлень',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff28103E),
                            fontSize: 16,
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
                                  Navigator.pop(context);
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
                                    'Закрити',
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
                                  AppSettings.openNotificationSettings();
                                  Navigator.pop(context);
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
                                    'Увімкнути',
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

  void getNotificationParametr(
      String timeChoice, String startOrFinish, int whichPicker) {
    if (startOrFinish == 'start') {
      switch (whichPicker) {
        case 0:
          start[0] = timeChoice;
          break;
        case 1:
          start[1] = timeChoice;
          break;
        case 2:
          start[2] = timeChoice;
          break;
      }
    }
    if (startOrFinish == 'finish') {
      switch (whichPicker) {
        case 0:
          finish[0] = timeChoice;

          break;
        case 1:
          finish[1] = timeChoice;
          break;
        case 2:
          finish[2] = timeChoice;
          break;
      }
    }
  }

  void getingNotificationLength(double value) {
    sliderValue = value.floorToDouble();
    notifyListeners();
  }

  void addNotification() {
    Random random = Random();
    int hourStart = int.parse(start[0]);
    int minuteStart = int.parse(start[1]);
    int secondStart = int.parse(start[2]);

    NotificationService.showScheduledNotification(
      id: random.nextInt(2000000),
      days: [1, 2, 3, 4, 5, 6, 7],
      time: Time(
        hourStart,
        minuteStart,
        secondStart,
      ),
      title: '...',
      body: '',
      payload: '',
    );
  }
}
