import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool _isObscure = true;

  void handleShowPassword() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void handleLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Navigator.pushNamedAndRemoveUntil(
        context, '/home', ModalRoute.withName('/home'));
    prefs.setBool('_isLogin', true);
  }

  @override
  Widget build(BuildContext context) {
    Widget userName = const TextField(
      decoration: InputDecoration(labelText: 'User name'),
    );

    Widget password = TextField(
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              onPressed: handleShowPassword,
              icon:
                  Icon(_isObscure ? Icons.visibility : Icons.visibility_off))),
      obscureText: _isObscure,
    );

    Widget login =
        TextButton(onPressed: handleLogin, child: const Text('Login'));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Login')),
          body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[userName, password, login],
                )),
          ),
        ));
  }
}
