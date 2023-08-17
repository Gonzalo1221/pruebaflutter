import 'package:flutter/material.dart';

class Tercernivel extends StatefulWidget {
  const Tercernivel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Tercernivel createState() => _Tercernivel();
}

class _Tercernivel extends State<Tercernivel> {
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
                const Icon(Icons.hotel),
                Container(
                  width: 100,
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
