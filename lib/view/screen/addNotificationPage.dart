import 'dart:ui';

import 'package:afirmation/bLogic/notificatonProvider/notifikacionProvider.dart';
import 'package:afirmation/bLogic/platform/platformProvider.dart';
import 'package:afirmation/view/platformForPage.dart';
import 'package:afirmation/view/widgets/headerButton.dart';
import 'package:afirmation/view/widgets/notificationButtons.dart';
import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotProvider extends StatelessWidget {
  const NotProvider({super.key, this.onBordOrSettings = 'onBord'});
  final String onBordOrSettings;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationProvider(),
      child: AddNotificationpage(
        onBordOrSettings: onBordOrSettings,
      ),
    );
  }
}

class AddNotificationpage extends StatefulWidget {
  const AddNotificationpage({super.key, this.onBordOrSettings = 'onBord'});
  final String onBordOrSettings;

  @override
  State<AddNotificationpage> createState() => _AddNotificationpageState();
}

class _AddNotificationpageState extends State<AddNotificationpage> {
  @override
  void initState() {
    if (widget.onBordOrSettings == 'onBord') {
      NotificationProvider notificationProviderInitState =
          context.read<NotificationProvider>();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        notificationProviderInitState.notPermissionQuestion(context);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NotificationProvider notificationProvider =
        context.watch<NotificationProvider>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/notifImage.png"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 27,
                  left: 16,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Blur(
                          borderRadius: BorderRadius.circular(5),
                          blur: 2.5,
                          blurColor: Colors.white,
                          child: const SizedBox(
                            width: 44,
                            height: 44,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      alignment: Alignment.center,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Image.asset(
                          'assets/icons/notifRightArrow.png',
                          width: 14,
                          height: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 23,
                      bottom: MediaQuery.of(context).size.height / 21,
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'Налаштуй щоденне',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff28103E),
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'повідомлення для додатку',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff28103E),
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Notificationbutton(
                    onClick: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Center(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        1.6,
                                    child: Dialog(
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 14,
                                                    right: 14,
                                                  ),
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
                                              top: 37,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '${notificationProvider.start[0]}:${notificationProvider.start[1]}',
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xff28103E),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 24,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          notificationProvider
                                                              .changePermission(
                                                                  'start');
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: notificationProvider
                                                                          .startButtonPermission
                                                                      ? const Color(
                                                                          0xff7D2DC5)
                                                                      : const Color(
                                                                          0xffF8F8FC),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    40,
                                                                  )),
                                                          width: 50,
                                                          height: 30,
                                                          child: AnimatedAlign(
                                                            duration:
                                                                const Duration(
                                                              microseconds: 800,
                                                            ),
                                                            alignment: notificationProvider
                                                                    .startButtonPermission
                                                                ? Alignment
                                                                    .centerRight
                                                                : Alignment
                                                                    .centerLeft,
                                                            child: Container(
                                                              width: 26,
                                                              height: 26,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  100,
                                                                ),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0.15),
                                                                      spreadRadius:
                                                                          0,
                                                                      blurRadius:
                                                                          2),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                              top: 36,
                                            ),
                                            height: MediaQuery.of(context)
                                                    .copyWith()
                                                    .size
                                                    .height /
                                                5,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: CupertinoPicker(
                                                    scrollController:
                                                        FixedExtentScrollController(
                                                            initialItem: int.parse(
                                                                notificationProvider
                                                                    .start[0])),
                                                    itemExtent: 25,
                                                    onSelectedItemChanged: (i) {
                                                      String
                                                          selectedValueToString =
                                                          i.toString();
                                                      if (i <= 9) {
                                                        selectedValueToString =
                                                            '0$i';
                                                      }
                                                      notificationProvider
                                                          .getNotificationParametr(
                                                              selectedValueToString,
                                                              'start',
                                                              0);
                                                    },
                                                    children: List.generate(
                                                      24,
                                                      (index) {
                                                        String value =
                                                            (index).toString();
                                                        if (int.parse(value) <=
                                                            9) {
                                                          value = '0$value';
                                                        }
                                                        return Text(value);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                  child: Text(
                                                    ':',
                                                    style: TextStyle(
                                                      color: Color(0xff28103E),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CupertinoPicker(
                                                    scrollController:
                                                        FixedExtentScrollController(
                                                            initialItem: int.parse(
                                                                notificationProvider
                                                                    .start[1])),
                                                    itemExtent: 25,
                                                    onSelectedItemChanged: (i) {
                                                      String
                                                          selectedValueToString =
                                                          i.toString();
                                                      if (i <= 9) {
                                                        selectedValueToString =
                                                            '0$i';
                                                      }
                                                      notificationProvider
                                                          .getNotificationParametr(
                                                              selectedValueToString,
                                                              'start',
                                                              1);
                                                    },
                                                    children: List.generate(
                                                      60,
                                                      (index) {
                                                        String value =
                                                            (index).toString();
                                                        if (int.parse(value) <=
                                                            9) {
                                                          value = '0$value';
                                                        }
                                                        return Text(value);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                  child: Text(
                                                    ':',
                                                    style: TextStyle(
                                                      color: Color(0xff28103E),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CupertinoPicker(
                                                    scrollController:
                                                        FixedExtentScrollController(
                                                            initialItem: int.parse(
                                                                notificationProvider
                                                                    .start[2])),
                                                    itemExtent: 25,
                                                    onSelectedItemChanged: (i) {
                                                      String
                                                          selectedValueToString =
                                                          i.toString();
                                                      if (i <= 9) {
                                                        selectedValueToString =
                                                            '0$i';
                                                      }
                                                      notificationProvider
                                                          .getNotificationParametr(
                                                              selectedValueToString,
                                                              'start',
                                                              2);
                                                    },
                                                    children: List.generate(
                                                      60,
                                                      (index) {
                                                        String value =
                                                            (index).toString();
                                                        if (int.parse(value) <=
                                                            9) {
                                                          value = '0$value';
                                                        }
                                                        return Text(
                                                          value,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 24,
                                              vertical: 28,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      notificationProvider
                                                          .cencel('start');
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 14,
                                                        horizontal: 15,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          width: 2,
                                                          color: const Color(
                                                              0xff7D2DC5),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        'Відмінити',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff7D2DC5),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                      if (notificationProvider
                                                          .startButtonPermission) {
                                                        notificationProvider
                                                            .apply('start');
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 16,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: notificationProvider
                                                                .startButtonPermission
                                                            ? const Color(
                                                                0xff7D2DC5)
                                                            : const Color(
                                                                0xffEEEEF0),
                                                      ),
                                                      child: Text(
                                                        'Застосувати',
                                                        style: TextStyle(
                                                          color: notificationProvider
                                                                  .startButtonPermission
                                                              ? const Color(
                                                                  0xffF9F9F9)
                                                              : const Color(
                                                                  0xffC4C2D2),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                              );
                            },
                          );
                        },
                      );
                    },
                    text: 'Початок',
                    number:
                        "${notificationProvider.start[0]}:${notificationProvider.start[1]}",
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: HeaderButtonWidget(
                      text: 'Дозволити та зберегти',
                      onClick: () {
                        if (widget.onBordOrSettings == 'onBord') {
                          notificationProvider.addNotification();
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
                        } else {
                          if (notificationProvider.startButtonPermission) {
                            notificationProvider.addNotification();

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

                            PageIndex.indexPage = 0;
                          }
                        }
                      },
                      activeOrNot: widget.onBordOrSettings == 'onBord'
                          ? true
                          : notificationProvider.notActiveButton,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
