import 'package:flutter/material.dart';

class Primernivel extends StatefulWidget {
  const Primernivel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Primernivel createState() => _Primernivel();
}

class _Primernivel extends State<Primernivel> {
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
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset('assets/descansar.png', fit: BoxFit.cover),
                ),
                const SizedBox(height: 10),
                const Text('ES MUY IMPORTANTE DESCANSAR',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
