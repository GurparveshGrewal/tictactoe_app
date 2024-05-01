import 'package:flutter/material.dart';
import 'package:tictactoe_app/features/main_screen/entities/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  Player _player1 = Player.empty();
  Player _player2 = Player.empty();
  final List<String> _displayElements = ['', '', '', '', '', '', '', '', ''];
  int _filledBoxes = 0;

  Map<String, dynamic> get roomData => _roomData;
  Player get player1 => _player1;
  Player get player2 => _player2;
  List<String> get displayElements => _displayElements;
  int get filledBoxes => _filledBoxes;

  set filledBoxTo0(int value) {
    _filledBoxes = value;
  }

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> playerData) {
    _player1 = Player.fromMap(playerData);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> playerData) {
    _player2 = Player.fromMap(playerData);
    notifyListeners();
  }

  void updateDisplayElements(int index, String choice) {
    _displayElements[index] = choice;
    _filledBoxes += 1;
    notifyListeners();
  }
}
