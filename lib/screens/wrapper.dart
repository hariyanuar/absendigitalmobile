import 'package:absendigital/models/user.dart';
import 'package:absendigital/screens/auth/login.dart';
import 'package:absendigital/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    if (user == null) {
      return Login();
    } else {
      return Home();
    }
  }
}
