import 'package:afirmation/bLogic/localStorage/initShared.dart';
import 'package:afirmation/bLogic/notificatonProvider/notificationService.dart';
import 'package:afirmation/view/platformForPage.dart';
import 'package:afirmation/view/screen/loadingPage.dart';
import 'package:afirmation/view/screen/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
// import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService().initNotification();
  NotificationService.init(
    initScheduled: true,
  );
  // tz.initializeTimeZones();
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: LoadingPage()));
}

class AfirmationApp extends StatefulWidget {
  const AfirmationApp({super.key});

  @override
  State<AfirmationApp> createState() => _AfirmationAppState();
}

class _AfirmationAppState extends State<AfirmationApp> {
  late SharedPreferencesCustom getSharedObject;
  @override
  void initState() {
    getFirstJoinOrNotValue();
    super.initState();
  }

  void getFirstJoinOrNotValue() async {
    getSharedObject = SharedPreferencesCustom();
    await getSharedObject.initShared();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: getSharedObject.initShared(),
        builder: (context, dataFuture) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              body: dataFuture.data != null
                  ? dataFuture.data!.getBool('firstJoinOrNot') == null
                      ? const WelcomePage()
                      : const PlatformPageWithProvider()
                  : const Scaffold(),
            ),
          );
        });
  }
}
