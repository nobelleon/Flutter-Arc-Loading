import 'package:arc_loading/src/pages/screens/beranda.dart';
import 'package:flutter/material.dart';

//  static const Color nearlyWhite = Color(0xFFFAFAFA);
//   static const Color white = Color(0xFFFFFFFF);
//   static const Color background = Color(0xFFF2F3F8);
//   static const Color nearlyDarkBlue = Color(0xFF2633C5);

//   static const Color nearlyBlue = Color(0xFF00B6F0);
//   static const Color nearlyBlack = Color(0xFF213333);
//   static const Color grey = Color(0xFF3A5160);
//   static const Color dark_grey = Color(0xFF313A44);

//   static const Color darkText = Color(0xFF253840);
//   static const Color darkerText = Color(0xFF17262A);
//   static const Color lightText = Color(0xFF4A6572);
//   static const Color deactivatedText = Color(0xFF767676);
//   static const Color dismissibleBackground = Color(0xFF364A54);
//   static const Color spacer = Color(0xFFF2F2F2);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arc Loading',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Beranda(),
    );
  }
}
