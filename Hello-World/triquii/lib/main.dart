import 'package:flutter/material.dart';
import 'dart:math';

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
  bool gameEnded = false;

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
        } else if (isBoardFull(board)) {
          gameEnded = true;
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
          if (currentPlayer == 'O' && !gameEnded) {
            makeBotMove();
          }
        }
      });
    }
  }

  void makeBotMove() {
    int bestScore = -9999;
    int bestMoveRow = -1;
    int bestMoveCol = -1;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          board[i][j] = 'O';
          int score = minimax(board, 0, false);
          board[i][j] = '';
          if (score > bestScore) {
            bestScore = score;
            bestMoveRow = i;
            bestMoveCol = j;
          }
        }
      }
    }

    makeMove(bestMoveRow, bestMoveCol);
  }

  int minimax(List<List<String>> board, int depth, bool isMaximizing) {
    if (checkWinForPlayer('O', board)) {
      return 10 - depth;
    } else if (checkWinForPlayer('X', board)) {
      return depth - 10;
    } else if (isBoardFull(board)) {
      return 0;
    }

    if (isMaximizing) {
      int maxScore = -9999;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == '') {
            board[i][j] = 'O';
            int score = minimax(board, depth + 1, false);
            board[i][j] = '';
            maxScore = max(maxScore, score);
          }
        }
      }
      return maxScore;
    } else {
      int minScore = 9999;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == '') {
            board[i][j] = 'X';
            int score = minimax(board, depth + 1, true);
            board[i][j] = '';
            minScore = min(minScore, score);
          }
        }
      }
      return minScore;
    }
  }

  bool checkWinForPlayer(String player, List<List<String>> board) {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == player && board[i][1] == player && board[i][2] == player) {
        return true;
      }
      if (board[0][i] == player && board[1][i] == player && board[2][i] == player) {
        return true;
      }
    }
    if (board[0][0] == player && board[1][1] == player && board[2][2] == player) {
      return true;
    }
    if (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
      return true;
    }
    return false;
  }

  bool isBoardFull(List<List<String>> board) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          return false;
        }
      }
    }
    return true;
  }

  bool checkWinner(int row, int col) {
    String player = board[row][col];

    if (board[row][0] == player && board[row][1] == player && board[row][2] == player) {
      return true;
    }

    if (board[0][col] == player && board[1][col] == player && board[2][col] == player) {
      return true;
    }

    if ((board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
        (board[0][2] == player && board[1][1] == player && board[2][0] == player)) {
      return true;
    }

    return false;
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
