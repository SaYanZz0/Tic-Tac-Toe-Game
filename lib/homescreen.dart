import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'game_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String ActivePlayer = 'X';
  String result = 'Xsnjnsfdslnglos';
  bool GameOver = false;
  int Turn = 0;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SwitchListTile.adaptive(
                title: const Text("Turn on/off Two Players Mode",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25)),
                value: isSwitched,
                onChanged: (bool newValue) {
                  setState(() {
                    isSwitched = newValue;
                  });
                }),
            Text(
              "it's $ActivePlayer Turn".toUpperCase(),
              style: const TextStyle(fontSize: 35),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 8,
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                childAspectRatio: 1.0,
                children: List.generate(
                    9,
                    (index) => InkWell(
                          onTap:GameOver? null : (){_ontap(index);},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).shadowColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                Player.PlayerX.contains(index)
                                    ? 'X'
                                    : Player.PlayerO.contains(index)
                                        ? 'O'
                                        : '',
                                style: TextStyle(
                                    fontSize: 45,
                                    color: Player.PlayerX.contains(index)
                                        ? Colors.blue
                                        : Colors.pink),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            Text(
              result,
              style: const TextStyle(fontSize: 35, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    Player.PlayerO = [];
                    Player.PlayerX = [];
                    ActivePlayer = 'X';
                    result = '';
                    GameOver = false;
                    Turn = 0;
                  });
                },
                icon: const Icon(Icons.replay),
                label: const Text('Repeat The Game'))
          ],
        ),
      )),
    );
  }

  void _ontap(int index) async  {

    if ((Player.PlayerX.isEmpty || !Player.PlayerX.contains(index)) &&
        (Player.PlayerO.isEmpty || !Player.PlayerO.contains(index))) {
      Game.playGame(index, ActivePlayer);
      Updategame();
    }
    if(!isSwitched && !GameOver ){
      Game.autoPlay(ActivePlayer);
      Updategame();
    }
  }

  void Updategame() {
      setState(() {
        ActivePlayer = (ActivePlayer == 'X') ? 'O' : 'X';
        Turn++;
      });
      String winnerPlayer = Game.checkWinner();
      if(winnerPlayer == '' && Turn == 9){
        result = "It's a Draw";
      }
      else {
        result = '$winnerPlayer is The Winner';
      }
  }
}
