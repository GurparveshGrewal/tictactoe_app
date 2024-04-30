import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_app/provider/room_data_provider.dart';
import 'package:tictactoe_app/utils/commons/widgets/custom_textfield.dart';

class WaitingLobbyScreen extends StatefulWidget {
  const WaitingLobbyScreen({super.key});

  @override
  State<WaitingLobbyScreen> createState() => _WaitingLobbyScreenState();
}

class _WaitingLobbyScreenState extends State<WaitingLobbyScreen> {
  late TextEditingController _roomIdController;

  @override
  void initState() {
    super.initState();
    _roomIdController = TextEditingController(
        text: Provider.of<RoomDataProvider>(context, listen: false)
            .roomData['_id']);
  }

  @override
  void dispose() {
    _roomIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Waiting for the players to join'),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: _roomIdController,
            hintText: '',
            isReadOnly: true,
          )
        ],
      ),
    );
  }
}
