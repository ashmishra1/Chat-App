import 'package:bingo/services/google_login_service.dart';
import 'package:bingo/src/screens/home_scrren.dart';

import 'package:bingo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _isSigningIn
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ThemeColor.PrimaryColor),
                  ),
                )
              : OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: CircleBorder(),
                    side: BorderSide(width: 5, color: ThemeColor.PrimaryColor),
                  ),
                  onPressed: () async {
                    setState(() {
                      _isSigningIn = true;
                    });

                    var user =
                        await Authentication.signInWithGoogle(context: context);

                    setState(() {
                      _isSigningIn = false;
                    });

                    if (user != null) {
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Home(
                            user: user,
                          ),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            FontAwesomeIcons.google,
                            color: ThemeColor.PrimaryColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
