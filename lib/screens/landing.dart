import 'package:flutter/material.dart';
import 'package:flutter_app/state/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Landing extends ConsumerWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'hihi',
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, watch, child) {
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
    // return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}



// class Landing extends StatefulWidget {
//   const Landing({super.key});

//   @override
//   _LandingState createState() => _LandingState();
// }

// class _LandingState extends State<Landing> {
//   bool _isLogin = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserInfo();
//   }

//   _loadUserInfo() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     _isLogin = (prefs.getBool('_isLogin') ?? false);
//     if (_isLogin) {
//       Navigator.pushNamedAndRemoveUntil(
//           context, '/home', ModalRoute.withName('/home'));
//     } else {
//       Navigator.pushNamedAndRemoveUntil(
//           context, '/login', ModalRoute.withName('/login'));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: CircularProgressIndicator()));
//   }
// }

