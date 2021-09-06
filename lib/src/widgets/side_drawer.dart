import 'package:bingo/services/google_login_service.dart';
import 'package:bingo/src/screens/signin_screen.dart';
import 'package:bingo/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool isSigningOut = false;

  var user = FirebaseAuth.instance.currentUser;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundImage: NetworkImage(user!.photoURL!),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    user!.displayName!,
                    style: TextStyle(
                      color: ThemeColor.PrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.email,
              color: ThemeColor.PrimaryColor,
            ),
            title: Text(
              user!.email!,
              style: TextStyle(color: ThemeColor.PrimaryColor),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: ThemeColor.PrimaryColor,
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: ThemeColor.PrimaryColor),
            ),
            onTap: () async {
              setState(() {
                isSigningOut = true;
              });

              await Authentication.signOut(context: context);

              setState(() {
                isSigningOut = false;
              });

              await Navigator.of(context)
                  .pushReplacement(_routeToSignInScreen());
            },
            //{Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
