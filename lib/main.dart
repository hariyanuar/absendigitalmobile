import 'package:absendigital/models/user.dart';
import 'package:absendigital/screens/wrapper.dart';
import 'package:absendigital/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/login',
        routes: {
          '/wrapper': (ctx) => Wrapper(),
        },
        theme: ThemeData(
          buttonColor: Color(0xff008FFF),
          hintColor: Color(0xffA6B0BD),
          scaffoldBackgroundColor: Color(0xFFfafafa),
          textTheme: TextTheme(
            button: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: 3,
              ),
            ),
            headline1: GoogleFonts.nunito(
              textStyle: TextStyle(
                fontSize: 54,
                //fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Color(0xff000912),
                letterSpacing: 10,
              ),
            ),
            subtitle1: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff000912),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
