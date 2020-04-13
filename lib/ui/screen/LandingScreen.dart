import 'package:flutter/material.dart';
import 'package:project_inovation/ui/screen/LoginScreen.dart';

class LandingScreen extends StatefulWidget {
  static const id = 'LandingScreen';
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((onValue) {
      Navigator.pushReplacementNamed(context, Loginscreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.code,
              size: 48.0,
              color: Colors.yellow,
            ),
            Center(
              child: Text(
                'TMS Mobile',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}


