import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_app/features/game_screen/views/waiting_lobby.dart';
import 'package:tictactoe_app/features/game_screen/widgets/score_board.dart';
import 'package:tictactoe_app/features/game_screen/widgets/tic_tac_toe_board.dart';
import 'package:tictactoe_app/provider/room_data_provider.dart';
import 'package:tictactoe_app/resources/socket/socket_methods.dart';
import 'package:tictactoe_app/utils/show_snackbar.dart';

class GameStartScreen extends StatefulWidget {
  static String routeName = '/game-start-page';
  const GameStartScreen({super.key});

  @override
  State<GameStartScreen> createState() => _GameStartScreenState();
}

class _GameStartScreenState extends State<GameStartScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.updatePlayersListener(context);
    _socketMethods.updateRoomListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        showSnackbar(context, "Game has already started!\nCan't go back");
      },
      child: Scaffold(
        body: roomDataProvider.roomData['isJoin']
            ? const WaitingLobbyScreen()
            : SafeArea(
                child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ScoreBoardWidget(),
                    const TicTacToeBoardWidget(),
                    Text(
                      '${roomDataProvider.roomData['turn']['nickname']}\'s turn',
                      style: TextStyle(
                          color: roomDataProvider.roomData['turn']
                                      ['playerType'] ==
                                  'O'
                              ? Colors.red
                              : Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
      ),
    );
  }
}
