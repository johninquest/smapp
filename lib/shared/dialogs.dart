import 'package:flutter/material.dart';
import '../pages/login.dart';
import '../utils/router.dart';
import '../styles/colors.dart';

class InfoDialog extends StatelessWidget {
  // const InfoDialog({ Key? key }) : super(key: key);
  final String infoMessage;
  InfoDialog(this.infoMessage);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(
        Icons.info_outline,
        color: primaryColor,
        size: 40.0,
      ),
      content: Text(
        infoMessage,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ))
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  // const ErrorDialog({ Key? key }) : super(key: key);
  final String errorMessage;
  const ErrorDialog(this.errorMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(
        Icons.report_outlined,
        color: primaryColor,
        size: 40.0,
      ),
      content: Text(
        errorMessage,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'OK',
                  style: TextStyle(fontSize: 20, color: primaryColor),
                ),
              ],
            ))
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(
        Icons.info_outline,
        color: primaryColor,
        size: 40.0,
      ),
      content: const Text(
        'Log out ?',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'NO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textBlackColor,
                    letterSpacing: 1.0),
              ),
            ),
            TextButton(
                onPressed: () {
                  PageRouter().navigateToPage(const LoginPage(), context);
                },
                child: const Text(
                  'YES',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ))
          ],
        ),
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}


/* class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        Icons.info,
        color: primaryColor,
        size: 40.0,
      ),
      content: Text(
        'Log out ?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: primaryColor, fontSize: 20.0),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'NO',
                style: TextStyle(color: myRed, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
                onPressed: () {
                  final _spHelper = SharedPreferencesHelper();
                  _spHelper.removeData('loginId');
                  _spHelper.removeData('currentUserData').then((_) {
                    PageRouter().navigateToPage(LoginPage(), context);
                  });

                  // PageRouter().navigateToPage(LoginPage(), context);
                },
                child: Text(
                  'YES',
                  style: TextStyle(color: myGreen, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}
 */