import 'package:bingo/models/firebase_initials.dart';
import 'package:bingo/src/widgets/google_login_button.dart';
import 'package:bingo/utils/colors.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        constraints: BoxConstraints.expand(),
        /*decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/loginbg.png'),
                fit: BoxFit.cover)),*/
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 130.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 350),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: ThemeColor.SecondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          children: [
                            Text(
                              'with',
                              style: TextStyle(
                                color: ThemeColor.SecondaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 30,
                              ),
                            ),
                            Container(
                              height: 2,
                              width: 25,
                              color: ThemeColor.PrimaryColor,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FutureBuilder(
                      future:
                          Authentication.initializeFirebase(context: context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error initializing Firebase');
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return GoogleSignInButton();
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Text(
                      'made by Ashutosh',
                      style: TextStyle(fontSize: 12, color: Colors.black38),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
