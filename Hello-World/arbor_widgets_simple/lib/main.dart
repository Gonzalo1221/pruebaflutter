import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.home_outlined),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Este es un Container'),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.home_outlined),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Este es un Container'),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.home_outlined),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Este es un Container'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
