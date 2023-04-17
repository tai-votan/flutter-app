import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_app/state/auth.dart';
import 'package:flutter_app/storage.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget userName = const TextField(
      decoration: InputDecoration(labelText: 'User name'),
    );

    Widget password = const TextField(
      decoration: InputDecoration(labelText: 'Password'),
    );

    Widget login = TextButton(
      onPressed: () async {
        // if (checkNull) {
        final authArgs = AuthArgs(
          email: 'admin',
          password: 'admin',
        );
        ref.read(authLoginProvider(authArgs));
        final isAuthenticated = ref.read(getIsAuthenticatedProvider);
        if (isAuthenticated.value!) {
          context.go('/home');
        }
        // }
      },
      child: const Text('Login'),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[userName, password, login],
            ),
          ),
        ),
      ),
    );
  }
}
