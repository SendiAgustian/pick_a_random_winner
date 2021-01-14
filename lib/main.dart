import 'package:flutter/material.dart';
import 'package:pick_a_random_winner/Screens/home_screen.dart';
import 'package:pick_a_random_winner/Screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor primarySwatchColor = const MaterialColor(
  0xFF6078EA,
  const <int, Color>{
    50: const Color(0xFF3A6C87),
    100: const Color(0xFF3A6C87),
    200: const Color(0xFF3A6C87),
    300: const Color(0xFF3A6C87),
    400: const Color(0xFF3A6C87),
    500: const Color(0xFF3A6C87),
    600: const Color(0xFF3A6C87),
    700: const Color(0xFF3A6C87),
    800: const Color(0xFF3A6C87),
    900: const Color(0xFF3A6C87),
  },
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pick a Random Winner',
      theme: ThemeData(
        primarySwatch: primarySwatchColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        'home-screen': (BuildContext context) => HomeScreen(),
      },
    );
  }
}
