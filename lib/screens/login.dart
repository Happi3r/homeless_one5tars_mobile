import 'package:flutter/material.dart';
import 'package:homeless/services/login.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final res = await LoginService.naver.login();
                print(res ?? 'naver login error');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                'Login with Naver',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final res = await LoginService.kakao.login();
                print(res ?? 'kakao login error');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text(
                'Login with Kakao',
                style: TextStyle(color: Color(0xFF3F3035)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
