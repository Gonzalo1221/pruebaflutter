import 'package:flutter/material.dart';

// class MyAppBar extends StatelessWidget {
//   MyAppBar({required this.title});

//   final Widget title;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56.0,
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       decoration: BoxDecoration(color: Colors.blue[500]),
//       child: Row(
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation menu',
//             onPressed: null,
//           ),
//           Expanded(
//             child: title,
//           ),
//           IconButton(
//             icon: Icon(Icons.search),
//             tooltip: 'Search',
//             onPressed: null,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyScaffold extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Column(
//         children: <Widget>[
//           MyAppBar(
//             title: Text(
//               'Example title',
//               style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: Text('Hello, world!',
//               style: Theme.of(context).textTheme.headline6!.copyWith(color: Color.fromARGB(255, 255, 0, 0)),),

//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     title: 'My app',
//     home: MyScaffold(),
//   ));
// }

/*Juego de triqui*/

void main() {
  runApp(TriquiApp());
}

class TriquiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triqui',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: TriquiPage(),
    );
  }
}

class TriquiPage extends StatefulWidget {
  @override
  _TriquiPageState createState() => _TriquiPageState();
}

class _TriquiPageState extends State<TriquiPage> {
  List<List<String>> board = List<List<String>>.generate(3, (_) => List<String>.filled(3, ''));
  String currentPlayer = 'X';
  String winner = '';
  bool gameEnded = false; // Inicialización de gameEnded a false

  @override
  void initState() {
    super.initState();
    resetBoard();
  }

  void resetBoard() {
    setState(() {
      board = List<List<String>>.generate(3, (_) => List<String>.filled(3, ''));
      currentPlayer = 'X';
      winner = '';
      gameEnded = false;
    });
  }

  void makeMove(int row, int col) {
    if (board[row][col] == '' && !gameEnded) {
      setState(() {
        board[row][col] = currentPlayer;
        if (checkWinner(row, col)) {
          winner = currentPlayer;
          gameEnded = true;
        } else if (isBoardFull()) {
          gameEnded = true;
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool checkWinner(int row, int col) {
    String player = board[row][col];

    // Check row
    if (board[row][0] == player && board[row][1] == player && board[row][2] == player) {
      return true;
    }

    // Check column
    if (board[0][col] == player && board[1][col] == player && board[2][col] == player) {
      return true;
    }

    // Check diagonals
    if ((board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
        (board[0][2] == player && board[1][1] == player && board[2][0] == player)) {
      return true;
    }

    return false;
  }

  bool isBoardFull() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Triqui',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                int row = index ~/ 3;
                int col = index % 3;
                return GestureDetector(
                  onTap: () {
                    makeMove(row, col);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        board[row][col],
                        style: TextStyle(fontSize: 40, color: Colors.indigo),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (gameEnded)
            Text(
              winner != '' ? 'Ganador: $winner' : 'Empate',
              style: TextStyle(fontSize: 20),
            ),
          ElevatedButton(
            onPressed: resetBoard,
            child: Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}
