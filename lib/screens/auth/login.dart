import 'package:absendigital/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          color: Color(0xFFfafafa),
          width: double.infinity,
          child: Column(
            children: [
              _logo(),
              _logoText(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 25,
                            offset: Offset(0, 5),
                            spreadRadius: -25,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Masukan Email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000912),
                          ),
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 25),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Color(0xffA6B0BD),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 30.0,
                            color: Color(0xffA6B0BD),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 75,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 25,
                            offset: Offset(0, 5),
                            spreadRadius: -25,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Masukan Password' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: true,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000912),
                          ),
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 25),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Color(0xffA6B0BD),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 30.0,
                            color: Color(0xffA6B0BD),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 75,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20, bottom: 50),
                      decoration: BoxDecoration(
                          color: Color(0xff008FFF),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x60008FFF),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                              spreadRadius: 0,
                            ),
                          ]),
                      child: FlatButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            var result = await _auth.login(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Email atau password salah';
                                loading = false;
                              });
                            }
                          }
                        },
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: Text(
                          "Masuk",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      error,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _logo() {
  return Container(
      margin: EdgeInsets.only(top: 100),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/logo.jpeg'),
        radius: 50.0,
      ));
}

Widget _logoText() {
  return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: Text(
        "Gobsent",
        style: GoogleFonts.nunito(
          textStyle: TextStyle(
            fontSize: 54,
            fontWeight: FontWeight.w800,
            color: Color(0xff000912),
            letterSpacing: 10,
          ),
        ),
      ));
}
