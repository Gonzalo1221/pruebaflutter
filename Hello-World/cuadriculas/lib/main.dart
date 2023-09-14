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
      home: MedievoPage(),
    );
  }
}

class MedievoPage extends StatefulWidget {
  const MedievoPage({super.key});

  @override
  State<MedievoPage> createState() => _MedievoPageState();
}

class _MedievoPageState extends State<MedievoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text(
            'Gonzalo araujo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Open Sans',
            ),
          ),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.red[100],
              child:
                  const Text('Él haría que todos ustedes se desmoronen en el'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.red[200],
              child: const Text('No prestes atención a la chusma'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.red[300],
              child: const Text('Sonido de gritos pero el'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.red[400],
              child: const Text('quien grita'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.red[500],
              child: const Text('Se acerca la revolución...'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.red[600],
              child: const Text('Revolución, ellas/ellos ...'),
            ),
          ],
        ));
  }
}
