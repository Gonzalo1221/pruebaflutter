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
      appBar: AppBar(
        // Utiliza la AppBar de Segundonivel
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
                const Text(
                  'LA BELLEZA REFLEJADA EN UNA IMAGEN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    'assets/flor.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Icon(
                  Icons.star,
                  color: Colors.red[500],
                  size: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
