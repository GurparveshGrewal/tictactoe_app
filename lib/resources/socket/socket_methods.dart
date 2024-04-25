import 'package:flutter/material.dart';
import 'package:tictactoe_app/features/game_screen/views/game_screen.dart';
import 'package:tictactoe_app/resources/socket/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Navigator.of(context).pushNamed(GameStartScreen.routeName);
    });
  }
}
