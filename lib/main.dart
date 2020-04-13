import 'package:flutter/material.dart';
import 'package:project_inovation/ui/screen/LandingScreen.dart';
import 'package:project_inovation/ui/screen/LoginScreen.dart';
import 'package:project_inovation/ui/screen/QRScreen.dart';
import 'package:project_inovation/ui/screen/TransportsalesScreen.dart';
import 'package:project_inovation/ui/screen/ReviewTransportsales.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMS Mobile',
      theme: ThemeData.light(),
      initialRoute: LandingScreen.id,
      routes: {
        LandingScreen.id: (context) => LandingScreen(),
        Loginscreen.id: (context) => Loginscreen(),
        ScanQRScreen.id: (context) => ScanQRScreen(),
        Transportsales.id: (context) => Transportsales(),
        HasilTransportsales.id: (context) => HasilTransportsales(),
      },
    );
  }
}
