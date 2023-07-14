import 'dart:ui';

import 'package:afirmation/bLogic/platform/platformProvider.dart';
import 'package:afirmation/view/screen/addNotificationPage.dart';
import 'package:afirmation/view/screen/privacyPolicy.dart';
import 'package:afirmation/view/screen/termsOfUse.dart';
import 'package:afirmation/view/widgets/settingsButtons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    PlatformProvider platformProvider = context.watch<PlatformProvider>();
    return Padding(
      padding: const EdgeInsets.only(
        top: 110,
      ),
      child: Column(
        children: [
          SettingsButtonWidget(
            icon: Image.asset(
              'assets/icons/settingsIcon1.png',
              width: 18,
              height: 20,
            ),
            text: 'Сповіщення',
            onClick: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const NotProvider(
                    onBordOrSettings: 'settings',
                  ),
                  transitionDuration: const Duration(milliseconds: 450),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
          ),
          SettingsButtonWidget(
            icon: Image.asset(
              'assets/icons/Privacy Policy.png',
              width: 18,
              height: 20,
            ),
            text: 'Політика конфіденційності',
            onClick: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const PrivacyPolicy(),
                  transitionDuration: const Duration(milliseconds: 450),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
          ),
          SettingsButtonWidget(
            icon: Image.asset(
              'assets/icons/umovi.png',
              width: 18,
              height: 20,
            ),
            text: 'Умови використання',
            onClick: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const TermsOfUse(),
                  transitionDuration: const Duration(milliseconds: 450),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
          ),
          SettingsButtonWidget(
            icon: Image.asset(
              'assets/icons/share.png',
              width: 18,
              height: 20,
            ),
            text: 'Поділитися додатком',
            onClick: () {
              platformProvider.shareApp();
            },
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height / 6,
            ),
            child: GestureDetector(
              onTap: () {
                showDialog<String>(
                  context: context,
                  barrierColor: const Color.fromRGBO(233, 233, 233, 0.63),
                  builder: (BuildContext context) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
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
                                    top: 16,
                                    bottom: 16,
                                  ),
                                  child: Column(
                                    children: const [
                                      Text(
                                        'Чи ти впевнений, що',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff28103E),
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        'хочеш очистити кеш',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff28103E),
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        'додатку?',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff28103E),
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Column(
                                  children: const [
                                    Text(
                                      'Це може призвести до того,',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff28103E),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'що деякі дані будуть',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff28103E),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'видалені.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff28103E),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
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
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                              border: Border.all(
                                                width: 2,
                                                color: const Color(0xff7D2DC5),
                                              ),
                                            ),
                                            child: const Text(
                                              'Скасувати',
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
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 16,
                                              // horizontal: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color(0xff7D2DC5),
                                            ),
                                            child: const Text(
                                              'Очистити',
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
                );
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xff7D2DC5),
                  ),
                ),
                child: const Text(
                  'Очистити кеш',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff7D2DC5),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
