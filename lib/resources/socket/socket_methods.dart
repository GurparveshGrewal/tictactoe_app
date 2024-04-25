import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_app/features/game_screen/views/game_screen.dart';
import 'package:tictactoe_app/provider/room_data_provider.dart';
import 'package:tictactoe_app/resources/socket/socket_client.dart';
import 'package:tictactoe_app/utils/show_snackbar.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  // Emitters
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'nickname': nickname,
        'roomId': roomId,
      });
    }
  }

  // Listeners
  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.of(context).pushNamed(GameStartScreen.routeName);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.of(context).pushNamed(GameStartScreen.routeName);
    });
  }

  void errorOccurredListener(BuildContext context) {
    _socketClient.on('errorOccurred', (data) {
      showSnackbar(context, data);
    });
  }
}
