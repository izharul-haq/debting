import 'package:debting/controllers/theme_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/providers/theme_provider.dart';
import 'package:debting/routes/app_routes.dart';
import 'package:debting/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ContactAdapter());
  Hive.registerAdapter(DebtAdapter());

  await Hive.openBox<Contact>('debts');
  await Hive.openBox<dynamic>('settings');

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(DebtingApp());
}

class DebtingApp extends StatelessWidget {
  const DebtingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        title: 'Debting',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeftWithFade,
        themeMode: ThemeController().theme,
        theme: ThemeProvider.light,
        darkTheme: ThemeProvider.dark,
        getPages: AppRoutes.routes,
        initialRoute: RouteNames.home,
      ),
    );
  }
}
