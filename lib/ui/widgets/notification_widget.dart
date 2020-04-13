import 'package:flutter/material.dart';

class Notifications {
  Notifications._();

  static void showSnackBarWithError(BuildContext context, String message,
      {Key key}) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 1000),
          key: key,
          backgroundColor: Colors.red,
          content: Text(
            '${message ?? 'Sorry, an error has ocurred.'}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      );
  }

  static void showSnackBarWithSuccess(BuildContext context, String message,
      {Key key}) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          key: key,
          backgroundColor: Colors.green,
          content: Text(
            '${message ?? 'Success.'}',
            textAlign: TextAlign.center,
          ),
        ),
      );
  }
}
