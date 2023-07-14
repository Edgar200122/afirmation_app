import 'dart:async';
import 'dart:ui';

import 'package:afirmation/bLogic/localStorage/initShared.dart';
import 'package:afirmation/view/screen/afirmationPage.dart';
import 'package:afirmation/view/screen/settingsPage.dart';
import 'package:afirmation/view/screen/webViewPage.dart';
import 'package:afirmation/view/widgets/headerButton.dart';
import 'package:afirmation/view/widgets/passTheTest.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PlatformContext {
  static BuildContext? context;
}

class PageIndex {
  static int indexPage = 0;
}

class PlatformProvider extends ChangeNotifier {
  TextEditingController textEditingControllerGender = TextEditingController();
  FocusNode focusNodeGender = FocusNode();
  bool arrow = true;
  bool share = false;
  String topBarText = 'Ccloan';
  bool genderWindowPermission = true;
  bool textFieldFocusOrNot = false;
  int genderChoosing = 0;
  bool genderButtonHeader = true;
  bool shareOnetap = true;
  PlatformProvider() {
    pageChanger(PageIndex.indexPage);
    banLoadingPage();
  }
  void banLoadingPage() async {
    SharedPreferencesCustom.prefs.setBool('firstJoinOrNot', true);
    genderWindowPermission =
        SharedPreferencesCustom.prefs.getBool('genderWindows') ?? true;
  }

  List<Widget> pages = [
    AfirmationPage(),
    SettingsPage(),
    PassTheTest(),
    WebViewPage(),
    PassTheTestAgain(),
  ];
  Future<void> genderWindow() async {
    SharedPreferencesCustom.prefs.setBool('genderWindows', false);
    if (genderWindowPermission) {
      genderWindowPermission = false;
      showDialog<String>(
        context: PlatformContext.context!,
        barrierColor: const Color.fromRGBO(233, 233, 233, 0.63),
        builder: (BuildContext context) =>
            StatefulBuilder(builder: (context, setState) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SizedBox(
                  height: 424,
                  width: MediaQuery.of(context).size.width,
                  child: Dialog(
                    insetPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 60,
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
                                padding: const EdgeInsets.all(
                                  14,
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
                            top: 8,
                          ),
                          child: Column(
                            children: const [
                              Text(
                                'Допоможи нам',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff28103E),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'персоналізувати інформацію',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff28103E),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'для тебе',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff28103E),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 21,
                            right: 21,
                            top: 24,
                            bottom: 16,
                          ),
                          child: Stack(
                            children: [
                              Focus(
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    textFieldFocusOrNot = true;
                                    setState(() {});
                                  } else {}
                                },
                                child: TextField(
                                  controller: textEditingControllerGender,
                                  focusNode: focusNodeGender,
                                  onChanged: (value) {
                                    if (value.isNotEmpty &&
                                        genderChoosing != 0) {
                                      genderButtonHeader = true;
                                    }
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Ваше ім'я",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: textFieldFocusOrNot
                                          ? Color(0xff28103E)
                                          : Color(0xffC4C2D2),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xff7D2DC5),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffF8F8FC),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                child: Image.asset(
                                  'assets/icons/genderInputIcon.png',
                                  width: 24,
                                  height: 24,
                                  color: !textFieldFocusOrNot
                                      ? const Color(0xffC4C2D2)
                                      : const Color(0xff7D2DC5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 21,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    genderChoosing = 1;
                                    if (textEditingControllerGender
                                            .text.isNotEmpty &&
                                        genderChoosing != 0) {
                                      genderButtonHeader = true;
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      border: Border.all(
                                        width: 1,
                                        color: genderChoosing == 0
                                            ? Colors.transparent
                                            : genderChoosing == 1
                                                ? const Color(0xff7D2DC5)
                                                : Colors.transparent,
                                      ),
                                      color: const Color(0xffF8F8FC),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/ph_gender-female-duotone.png',
                                          width: 40,
                                          height: 58,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Жінка',
                                          style: TextStyle(
                                            color: Color(0xffC4C2D2),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    genderChoosing = 2;
                                    if (textEditingControllerGender
                                            .text.isNotEmpty &&
                                        genderChoosing != 0) {
                                      genderButtonHeader = true;
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      border: Border.all(
                                        width: 1,
                                        color: genderChoosing == 0
                                            ? Colors.transparent
                                            : genderChoosing == 2
                                                ? const Color(0xff7D2DC5)
                                                : Colors.transparent,
                                      ),
                                      color: Color(0xffF8F8FC),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/ph_gender-male-duotone.png',
                                          width: 40,
                                          height: 58,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Чоловік',
                                          style: TextStyle(
                                            color: Color(0xffC4C2D2),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 29,
                          ),
                          child: HeaderButtonWidget(
                            onClick: () {
                              if (textEditingControllerGender.text.isNotEmpty &&
                                  genderChoosing != 0) {
                                Navigator.pop(context);
                              }
                            },
                            text: 'Зберегти',
                            activeOrNot:
                                textEditingControllerGender.text.isNotEmpty &&
                                        genderChoosing != 0
                                    ? true
                                    : false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    }
  }

  void pageChanger(int clickData, [bool platformOrOtherPages = false]) {
    PageIndex.indexPage = clickData;
    switch (PageIndex.indexPage) {
      case 0:
        arrow = false;
        share = true;
        topBarText = 'Афірмації';
        break;
      case 1:
        arrow = false;
        share = false;
        topBarText = 'Налаштування';
        break;
      case 2:
        arrow = false;
        share = false;
        topBarText = 'Тест';
        break;
      case 3:
        arrow = true;
        share = false;
        topBarText = 'Ccloan';
        break;
    }
    notifyListeners();
  }

  void shareApp() async {
    try {
      Share.share("https://apps.apple.com/app/id00000000",
          subject: 'Look what I made!');
    } catch (e) {
      print(e);
    }
  }
}
