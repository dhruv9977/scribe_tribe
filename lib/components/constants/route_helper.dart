import 'package:get/get.dart';
import 'package:scribetribe/screens/auth/choosing_screen.dart';
import 'package:scribetribe/screens/auth/intro_screen.dart';
import 'package:scribetribe/screens/auth/login_screen/login_screen.dart';
import 'package:scribetribe/screens/scribe/AgeScreen.dart';
import 'package:scribetribe/screens/scribe/Date.dart';
import 'package:scribetribe/screens/scribe/Duration.dart';
import 'package:scribetribe/screens/scribe/ExamArea.dart';
import 'package:scribetribe/screens/scribe/ExamCity.dart';
import 'package:scribetribe/screens/scribe/ExamType.dart';
import 'package:scribetribe/screens/scribe/Subject.dart';
import 'package:scribetribe/screens/scribe/Time.dart';
import 'package:scribetribe/screens/scribe/city_screen.dart';
import 'package:scribetribe/screens/scribe/home/home_screen.dart';
import 'package:scribetribe/screens/scribe/language.dart';
import 'package:scribetribe/screens/scribe/pin_code_screen.dart';
import 'package:scribetribe/screens/scribe/state_screen.dart';
import 'package:scribetribe/screens/scribe/venue_name.dart';
import 'package:scribetribe/screens/tribe/home_screen/home_screen.dart';
import 'package:scribetribe/screens/tribe/registration_successful/reg_successful.dart';
import 'package:scribetribe/screens/tribe/select_language/select_language.dart';
import 'package:scribetribe/screens/tribe/tribe_details/tribe_details.dart';
import 'package:scribetribe/screens/tribe/userProfile.dart';

import '../../main.dart';
import '../../screens/auth/otp_screen/otp_screen.dart';
import '../../screens/scribe/NameScreen.dart';
import '../../screens/scribe/address_screen.dart';
import '../../screens/scribe/gender_screen.dart';

class RouteHelper {
  //initial
  static const String initial = "/";
  // registration
  static const String splashRoute = "/splash/";
  static const String loginRoute = '/login/';
  static const String otpRoute = '/otp/';
  static const String choosingRoute = '/choose/';
  //writer
  static const String detailsRoute = '/registration/';
  static const String selectLanguageRoute = '/selectLanguage/';
  static const String regSucessfulRoute = '/regSucc/';
  static const String homeRoute = '/home/';
  static const String detailRoute = '/detail/';
  //student
  static const String studentsNameScreen = '/stdNameScreen/';
  static const String studentsAgeScreen = '/stdAgeScreen/';
  static const String studentsGenderScreen = '/stdGenderScreen/';
  static const String studentsCityScreen = '/stdCityScreen/';
  static const String studentsStateScreen = '/stdStateScreen/';
  static const String studentsAddressScreen = '/stdAddressScreen/';
  static const String studentsPinCodeScreen = '/stdPinCodeScreen/';
  static const String studentsExamScreen = '/stdExamScreen/';
  static const String studentsSubjectScreen = '/stdSubScreen/';
  static const String studentsLanguageScreen = '/stdLangScreen/';
  static const String studentsDateScreen = '/stdDateScreen/';
  static const String studentsTimeScreen = '/stdTimeScreen/';
  static const String studentsDurationScreen = '/stdDurScreen/';
  static const String studentsExamCityScreen = '/stdExamCityScreen/';
  static const String studentsExamAreaScreen = '/stdExamAreaScreen/';
  static const String studentsExamVenueScreen = '/stdExamVenueScreen/';
  static const String studentsHomeRoute = '/stdHome/';

  //getters
  static String getLoginScreen() => loginRoute;
  static String getUserOtpScreen() => otpRoute;
  static String getChooseScreen() => choosingRoute;
  static String getRegistrationScreen() => detailsRoute;
  static String getLanguageScreen() => selectLanguageRoute;
  static String getRegSuccScreen() => regSucessfulRoute;
  static String getHomeScreen() => homeRoute;
  static String getDetailScreen() => detailRoute;
  static String getStudentNameScreen() => studentsNameScreen;
  static String getStudentAgeScreen() => studentsAgeScreen;
  static String getStudentCityScreen() => studentsCityScreen;
  static String getStudentStateScreen() => studentsStateScreen;
  static String getStudentAddressScreen() => studentsAddressScreen;
  static String getStudentPinCodeScreen() => studentsPinCodeScreen;
  static String getStudentGenderScreen() => studentsGenderScreen;
  static String getStudentExamScreen() => studentsExamScreen;
  static String getStudentSubjectScreen() => studentsSubjectScreen;
  static String getStudentLanguageScreen() => studentsLanguageScreen;
  static String getStudentDateScreen() => studentsDateScreen;
  static String getStudentTimeScreen() => studentsTimeScreen;
  static String getStudentDurationScreen() => studentsDurationScreen;
  static String getStudentExamCityScreen() => studentsExamCityScreen;
  static String getStudentExamAreaScreen() => studentsExamAreaScreen;
  static String getStudentExamVenueScreen() => studentsExamVenueScreen;
  static String getStudentHomeScreen() => studentsHomeRoute;

  // lists
  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () {
        return const IntroScreen();
      },
    ),
    GetPage(
      name: loginRoute,
      page: () {
        return const LoginScreen();
      },
    ),
    GetPage(
      name: otpRoute,
      page: () {
        return const UserOTPScreen();
      },
    ),
    GetPage(
      name: choosingRoute,
      page: () {
        return const ChoosingScreen();
      },
    ),
    GetPage(
      name: detailsRoute,
      page: () {
        return const TribeDetails();
      },
    ),
    GetPage(
      name: selectLanguageRoute,
      page: () {
        return const SelectLanguage();
      },
    ),
    GetPage(
      name: regSucessfulRoute,
      page: () {
        return const RegistrationSuccessfulScreen();
      },
    ),
    GetPage(
      name: homeRoute,
      page: () {
        return const HomeScreen();
      },
    ),
    GetPage(
      name: detailRoute,
      page: () {
        return const UserProfile();
      },
    ),
    GetPage(
      name: studentsNameScreen,
      page: () {
        return const NameScreen();
      },
    ),
    GetPage(
      name: studentsAgeScreen,
      page: () {
        return const AgeScreen();
      },
    ),
    GetPage(
      name: studentsGenderScreen,
      page: () {
        return const GenderScreen();
      },
    ),
    GetPage(
      name: studentsAddressScreen,
      page: () {
        return const AddressScreen();
      },
    ),
    GetPage(
      name: studentsLanguageScreen,
      page: () {
        return const Language();
      },
    ),
    GetPage(
      name: studentsCityScreen,
      page: () {
        return const CityScreen();
      },
    ),
    GetPage(
      name: studentsStateScreen,
      page: () {
        return const StateScreen();
      },
    ),
    GetPage(
      name: studentsPinCodeScreen,
      page: () {
        return const PinCodeScreen();
      },
    ),
    GetPage(
      name: studentsExamScreen,
      page: () {
        return const ExamType();
      },
    ),
    GetPage(
      name: studentsSubjectScreen,
      page: () {
        return const Subject();
      },
    ),
    GetPage(
      name: studentsDateScreen,
      page: () {
        return const Date();
      },
    ),
    GetPage(
      name: studentsTimeScreen,
      page: () {
        return const Time();
      },
    ),
    GetPage(
      name: studentsDurationScreen,
      page: () {
        return const DurationScreen();
      },
    ),
    GetPage(
      name: studentsExamCityScreen,
      page: () {
        return const ExamCity();
      },
    ),
    GetPage(
      name: studentsExamAreaScreen,
      page: () {
        return const ExamArea();
      },
    ),
    GetPage(
      name: studentsExamVenueScreen,
      page: () {
        return const VenueName();
      },
    ),
    GetPage(
      name: studentsHomeRoute,
      page: () {
        return const StudentHomeScreen();
      },
    ),
  ];
}
