import 'package:auth_firebase/common/localization/generated/l10n.dart';
import 'package:auth_firebase/common/services/firebase_options.dart';
import 'package:auth_firebase/common/theme/color_constants.dart';
import 'package:auth_firebase/common/widgets/border_radius_constants.dart';
import 'package:auth_firebase/common/widgets/underline_input_border_resolver.dart';
import 'package:auth_firebase/features/home/page/home_page.dart';
import 'package:auth_firebase/features/registration/page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  bool isLoggedIn = true;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
  void login() {
    setState(() {
      isLoggedIn = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: L10n.delegate.supportedLocales,
      theme: isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: isLoggedIn
          ? HomePage(
        toggleTheme: toggleTheme,
        checkDarkMode: isDarkMode,
      )
          : LoginPage(),
    );
  }
}

class MyThemes {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.ColorBlack_10,
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: ColorConstants.ColorWhite_FD,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorConstants.ColorWhite_FD,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      border: MaterialStateOutlineInputBorder.resolveWith(
        const UnderlineInputBorderResolver(),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.ColorBlack_10,
      toolbarHeight: 60.0,
      elevation: 0.0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: -0.32,
        fontWeight: FontWeight.w500,
        color: ColorConstants.ColorWhite_F3,
      ),
    ),
    sliderTheme: SliderThemeData(
      trackShape: const RectangularSliderTrackShape(),
      overlayShape: SliderComponentShape.noOverlay,
      minThumbSeparation: 0.0,
      trackHeight: 6.0,
    ),
    cardTheme: const CardTheme(
      elevation: 1.0,
      shadowColor: ColorConstants.ColorBlack_10,
      margin: EdgeInsets.zero,
      color: ColorConstants.ColorGrey_BF,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusConstants.circular8,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: -0.32,
        fontWeight: FontWeight.w500,
        color: ColorConstants.ColorWhite_BE,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        height: 28 / 18,
        letterSpacing: -0.36,
        fontWeight: FontWeight.w400,
        color: ColorConstants.ColorGrey_AD,
      ),
      bodySmall: TextStyle(
        fontFamily: 'danablack',
        fontSize: 18,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        color: ColorConstants.ColorWhite_FD,
      ),
      bodyLarge: TextStyle(
          fontSize: 14,
          height: 18 / 12,
          letterSpacing: -0.32,
          fontWeight: FontWeight.w400,
          color: ColorConstants.ColorBlack_10
      ),
      headlineSmall: TextStyle(
          fontSize: 24,
          height: 28 / 24,
          letterSpacing: -0.48,
          fontWeight: FontWeight.w400,
          color: ColorConstants.ColorWhite_FD
      ),
      headlineMedium: TextStyle(
        fontSize: 50,
        height: 32 / 28,
        letterSpacing: -0.56,
        fontWeight: FontWeight.w400,
        color: ColorConstants.ColorWhite_F3,
      ),
      displaySmall: TextStyle(
        fontSize: 30,
        height: 32 / 28,
        letterSpacing: -0.76,
        fontWeight: FontWeight.w400,
        color: ColorConstants.ColorGrey_AD,
      ),
      displayLarge: TextStyle(
        fontSize: 23,
        height: 24 / 16,
        letterSpacing: -0.32,
        fontWeight: FontWeight.w500,
        color: ColorConstants.ColorWhite_FD,
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.ColorWhite_FD,
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: ColorConstants.ColorWhite_FD,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorConstants.ColorWhite_FD,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      border: MaterialStateOutlineInputBorder.resolveWith(
        const UnderlineInputBorderResolver(),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.ColorBlack_10,
      toolbarHeight: 60.0,
      elevation: 0.0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: -0.32,
        fontWeight: FontWeight.w500,
        color: ColorConstants.ColorWhite_F3,
      ),
    ),
    sliderTheme: SliderThemeData(
      trackShape: const RectangularSliderTrackShape(),
      overlayShape: SliderComponentShape.noOverlay,
      minThumbSeparation: 0.0,
      trackHeight: 6.0,
    ),
    cardTheme: const CardTheme(
      elevation: 1.0,
      shadowColor: ColorConstants.ColorBlack_10,
      margin: EdgeInsets.zero,
      color: ColorConstants.ColorGrey_BF,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusConstants.circular8,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: -0.32,
        fontWeight: FontWeight.w500,
        color: ColorConstants.ColorWhite_BE,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        height: 28 / 18,
        letterSpacing: -0.36,
        fontWeight: FontWeight.w400,
        color: ColorConstants.ColorGrey_AD,
      ),
      bodySmall: TextStyle(
        fontFamily: 'danablack',
        fontSize: 18,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        color: ColorConstants.ColorWhite_FD,
      ),
    ),
  );
}
