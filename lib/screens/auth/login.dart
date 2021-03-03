import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Login extends StatefulWidget {
  bool _isPasswordObscure = true;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Container(
        margin: const EdgeInsets.only(top: 100),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo.jpeg'),
          radius: 50.0,
        ),
      );
    }

    Widget _logoText() {
      return Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: Text("ATTEND", style: Theme.of(context).textTheme.headline1),
      );
    }

    Widget _inputField(Icon prefixIcon, String hintText, bool isPassword) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            const Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 25,
              offset: const Offset(0, 5),
              spreadRadius: -25,
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 20),
        child: TextField(
          obscureText: isPassword && widget._isPasswordObscure,
          style: Theme.of(context).textTheme.subtitle1,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 25),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Theme.of(context).hintColor,
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: prefixIcon,
            prefixIconConstraints: BoxConstraints(
              minWidth: 75,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                        widget._isPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).hintColor),
                    onPressed: () {
                      setState(() {
                        widget._isPasswordObscure =
                            !(widget._isPasswordObscure);
                      });
                    },
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                const Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                const Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      );
    }

    Widget _loginBtn() {
      return Container(
        child: FlatButton(
          child: Container(
            child: Text('SIGN IN', style: Theme.of(context).textTheme.button,),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: buttonShadow,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                  spreadRadius: 0,
                ),
              ],
            ),
            padding: const EdgeInsets.all(25.0),
          ),
          color: Theme.of(context).buttonColor,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        margin: const EdgeInsets.only(top: 20, bottom: 50),
        width: double.infinity,
      );

      /*return InkWell(
        onTap: () => {print('Sign in pressed.')},
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20, bottom: 50),
          decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: buttonShadow,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                  spreadRadius: 0,
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Text(
                "SIGN IN",
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
        ),
      );*/
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Column(
              children: [
                _logo(),
                _logoText(),
                _inputField(
                    Icon(
                      Icons.email_outlined,
                      size: 30,
                      color: Theme.of(context).hintColor,
                    ),
                    "Email",
                    false),
                _inputField(
                    Icon(
                      Icons.lock_outline,
                      size: 30,
                      color: Theme.of(context).hintColor,
                    ),
                    "Password",
                    true),
                _loginBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
