import 'dart:math';

class Player {
  String x = 'X';
  String o = 'O';
  String empty = '';

  static List <int> PlayerX = [];
  static List <int> PlayerO = [];
}

extension containsAll on List{
  bool ContainsAll(int x, int y, [z]) {
    if (z == Null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  static void playGame(int index, String activeplayer) {
    if (activeplayer == 'X') {
      Player.PlayerX.add(index);
    }
    else {
      Player.PlayerO.add(index);
    }
  }

   static String checkWinner() {
    String winner = '';
    if (
    Player.PlayerX.ContainsAll(0, 1, 2) || Player.PlayerX.ContainsAll(
        0, 3, 6) || Player.PlayerX.ContainsAll(0, 4, 8) || Player.PlayerX
        .ContainsAll(2, 5, 8) || Player.PlayerX.ContainsAll(3, 6, 8) || Player
        .PlayerX.ContainsAll(1, 4, 7) || Player.PlayerX.ContainsAll(3, 4, 5) || Player.PlayerX.ContainsAll(6, 7, 8) || Player.PlayerX.ContainsAll(2, 4, 6)) {
      winner = 'X';
    }
    if(
    Player.PlayerO.ContainsAll(0, 1, 2) | Player.PlayerO.ContainsAll(
        0, 3, 6) | Player.PlayerO.ContainsAll(0, 4, 8) | Player.PlayerO
        .ContainsAll(2, 5, 8) | Player.PlayerO.ContainsAll(3, 6, 8) | Player
        .PlayerO.ContainsAll(1,4 , 7) || Player.PlayerO.ContainsAll(2, 4, 6) || Player.PlayerX.ContainsAll(3, 4, 5) || Player.PlayerX.ContainsAll(6, 7, 8)
    ){
      winner = 'O';
    }
    return winner;
  }

  static Future<void> autoPlay(activeplayer) async {
    int index = 0;
    List <int> emptyCells = [];
    for (int i = 0; i < 9; i++) {
      if (!Player.PlayerX.contains(i) && !Player.PlayerO.contains(i)) {
        emptyCells.add(i);
      }
    }
    if(Player.PlayerO.ContainsAll(0, 1) && emptyCells.contains(2)) {
      index = 2;
    }
    else if (Player.PlayerO.ContainsAll(0, 3) && emptyCells.contains(6)){
    index = 6;
    }
    else if (Player.PlayerO.ContainsAll(0, 4) && emptyCells.contains(8)){
    index = 8;
    }
    else if (Player.PlayerO.ContainsAll(2, 5) && emptyCells.contains(8)){
    index = 8;
    }
    else if (Player.PlayerO.ContainsAll(3, 4) && emptyCells.contains(5)){
    index = 5;
    }
    else if (Player.PlayerO.ContainsAll(2, 4) && emptyCells.contains(6)){
    index = 6;
    }
    else if (Player.PlayerO.ContainsAll(6, 7) && emptyCells.contains(8)){
    index = 8;
    }
    //Defence Smarter Start-Center
    else if(Player.PlayerX.ContainsAll(0, 1) && emptyCells.contains(2)) {
    index = 2;
    }
    else if (Player.PlayerX.ContainsAll(0, 3) && emptyCells.contains(6)){
    index = 6;
    }
    else if (Player.PlayerX.ContainsAll(0, 4) && emptyCells.contains(8)){
    index = 8;
    }
    else if (Player.PlayerX.ContainsAll(2, 5) && emptyCells.contains(8)){
    index = 8;
    }
    else if (Player.PlayerX.ContainsAll(3, 4) && emptyCells.contains(5)){
    index = 5;
    }
    else if (Player.PlayerX.ContainsAll(2, 4) && emptyCells.contains(6)){
    index = 6;
    }
    else if (Player.PlayerX.ContainsAll(6, 7) && emptyCells.contains(8)){
    index = 8;
    }
    //Defence Smarter Start-end
    if(Player.PlayerX.ContainsAll(0, 2) && emptyCells.contains(1)) {
    index = 1;
    }
    else if (Player.PlayerX.ContainsAll(0, 6) && emptyCells.contains(3)){
    index = 3;
    }
    else if (Player.PlayerX.ContainsAll(0, 8) && emptyCells.contains(4)){
    index = 4;
    }
    else if (Player.PlayerX.ContainsAll(2, 8) && emptyCells.contains(5)){
    index = 5;
    }
    else if (Player.PlayerX.ContainsAll(3, 5) && emptyCells.contains(4)){
    index = 4;
    }
    else if (Player.PlayerX.ContainsAll(2, 6) && emptyCells.contains(4)){
    index = 4;
    }
    else if (Player.PlayerX.ContainsAll(6, 8) && emptyCells.contains(7)){
    index = 7;
    }
    //Defence Smarter Center-End
    if(Player.PlayerX.ContainsAll(2, 1) && emptyCells.contains(0)) {
    index = 0;
    }
    else if (Player.PlayerX.ContainsAll(6, 3) && emptyCells.contains(0)){
    index = 0;
    }
    else if (Player.PlayerX.ContainsAll(8, 4) && emptyCells.contains(0)){
    index = 0;
    }
    else if (Player.PlayerX.ContainsAll(8, 5) && emptyCells.contains(2)){
    index = 2;
    }
    else if (Player.PlayerX.ContainsAll(5, 4) && emptyCells.contains(3)){
    index = 3;
    }
    else if (Player.PlayerX.ContainsAll(6, 4) && emptyCells.contains(2)){
    index = 2;
    }
    else if (Player.PlayerX.ContainsAll(8, 7) && emptyCells.contains(6)){
    index = 6;
    }
else {
      Random random = Random();
      int randomindex = random.nextInt(emptyCells.length);
      index = emptyCells[randomindex];
      playGame(index, activeplayer);
    }
  }
}