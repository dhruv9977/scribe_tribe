import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/urls.dart';
import 'package:scribetribe/components/helpers/dependencies.dart';
import 'package:scribetribe/screens/auth/intro_screen.dart';
import 'package:scribetribe/screens/scribe/NameScreen.dart';
import 'package:scribetribe/screens/scribe/home/home_screen.dart';
import 'package:scribetribe/screens/tribe/home_screen/home_screen.dart';
import 'package:scribetribe/screens/tribe/select_language/select_language.dart';
import 'package:scribetribe/screens/tribe/tribe_details/tribe_details.dart';
import 'package:scribetribe/services/auth/auth_service.dart';

import 'components/constants/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.kPrimaryColor,
        ),
        // primarySwatch:
        //     MaterialColor(0xff4E0ADD, {0xff4E0ADD: AppColors.kPrimaryColor}),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // home: SelectLanguage(),
// routing
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (UrlConstants.isStudent.isBool == true) {
                return const StudentHomeScreen();
              } else {
                return const HomeScreen();
              }
            } else {
              return const IntroScreen();
            }
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
