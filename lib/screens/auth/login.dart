import 'package:absendigital/services/auth.dart';
import 'package:absendigital/utils/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  //input text
  String email = '';
  String password = '';
  String error = '';

  //passoword ui
  bool _isPasswordObscure = true;
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Image.asset('assets/images/logo.png'),
              ),
              Text(
                'Gotend',
                style: whiteTextStyle.copyWith(fontSize: 45),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Masukan Email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined, size: 30),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Masukan Password' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: isPassword,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline, size: 30),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: greyColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordObscure = !_isPasswordObscure;
                                isPassword = !isPassword;
                              });
                            },
                          ),
                        )),
                    SizedBox(height: 30),
                    Container(
                      child: FlatButton(
                        child: Container(
                          child: Text('Login',
                              style: Theme.of(context).textTheme.button),
                          padding: EdgeInsets.all(25),
                        ),
                        color: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            var result = await _auth.login(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Email atau password salah';
                              });
                            }
                          }
                        },
                      ),
                      margin: const EdgeInsets.only(top: 20, bottom: 50),
                      width: double.infinity,
                    ),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 23)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
