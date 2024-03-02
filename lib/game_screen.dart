import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
// ignore: camel_case_types, must_be_immutable
class game_screen extends StatefulWidget {
  String player1;
  String player2;
  game_screen({required this.player1, required this.player2});
  @override
  State<game_screen> createState() => _game_screenState();
}
class _game_screenState extends State<game_screen> {
  late List<List<String>> _board;
  late String _currentplayer;
  late String _winner;
  late bool _gameover;
  @override
  void initState() {
    super.initState();
    _board = List.generate(3, (_) => List.generate(3, (_) => ""));
    _currentplayer = "X";
    _winner = "";
    _gameover = false;
  }
  //Reset game
  void _resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.generate(3, (_) => ""));
      _currentplayer = "X";
      _winner = "";
      _gameover = false;
    });
  }
  void makeMove(int row, int col) {
    if (_board[row][col] != "" || _gameover) {
      return;
    }
    setState(() {
      _board[row][col] = _currentplayer;
      //check for a winner
      if (_board[row][0] == _currentplayer &&          _board[row][1] == _currentplayer &&
          _board[row][2] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      } else if (_board[0][col] == _currentplayer &&
          _board[1][col] == _currentplayer &&
          _board[2][col] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      } else if (_board[0][0] == _currentplayer &&
          _board[1][1] == _currentplayer &&
          _board[2][2] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      } else if (_board[0][2] == _currentplayer &&
          _board[1][1] == _currentplayer &&
          _board[2][0] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      } else if (_board[0][col] == _currentplayer &&
          _board[1][col] == _currentplayer &&
          _board[2][col] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      }

      //switch player
      _currentplayer = _currentplayer == "X" ? "O" : "X";

      // check for a tie
      // check for a tie
      if (!_gameover &&
          _board.every((row) => row.every((cell) => cell.isNotEmpty))) {
        _gameover = true;
        _winner = "It's a tie";
      }
      if (_winner != "") {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          btnOkText: "Play Again",
          title: _winner == "X"
              ? "${widget.player1} won!"
              : _winner == "O"
              ? "${widget.player2} won!"
              : "It's a Tie",
          btnOkOnPress: () {
            _resetGame();
          },
        ).show();
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(66, 43, 25, 212),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 120,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 100)),
                      const Text(
                        "Turn:  ",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        _currentplayer == "X"
                            ? "${widget.player1} ($_currentplayer)"
                            : "${widget.player2} ($_currentplayer)",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: _currentplayer == "X"
                                ? const Color.fromARGB(255, 236, 184, 70)
                                : const Color.fromARGB(255, 234, 166, 159)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 90, 122, 137),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(5),
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;

                  return GestureDetector(
                    onTap: () {
                      if (_board[row][col] == '') {
                        makeMove(row, col);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(95, 17, 12, 12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(_board[row][col],
                            style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color: _board[row][col] == "X"
                                    ? const Color.fromARGB(255, 236, 184, 70)
                                    : const Color.fromARGB(
                                    255, 244, 163, 154))),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: _resetGame,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 20),
                    child: const Text(
                      "Reset Game",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 240, 239, 237)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 20),
                    child: const Text(
                      "Restart  Game",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 246, 246, 242)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
