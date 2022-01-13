import 'package:flutter/material.dart';
import 'Screens/fingerprint_page.dart';
import 'Screens/home.dart';

void main() {
  runApp(MyApp());

} 
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:  ThemeData(
      primaryColor: const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF167F67)),
    ),
    home:  FingerprintPage(),
  );
  }
}