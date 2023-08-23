import 'package:flutter/material.dart';

class Segundonivel extends StatefulWidget {
  const Segundonivel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Segundonivel createState() => _Segundonivel();
}

class _Segundonivel extends State<Segundonivel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gonzalo Araujo'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    'assets/programacion.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'Sabes ¿Que es la Programacion?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
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
