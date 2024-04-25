import 'package:flutter/material.dart';
import 'package:tictactoe_app/resources/socket/socket_methods.dart';
import 'package:tictactoe_app/utils/commons/widgets/custom_button.dart';
import 'package:tictactoe_app/utils/commons/widgets/custom_text.dart';
import 'package:tictactoe_app/utils/commons/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static const String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _roomCodeController = TextEditingController();
  final TextEditingController _nameCodeController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.updatePlayersListener(context);
    _socketMethods.errorOccurredListener(context);
  }

  @override
  void dispose() {
    _nameCodeController.dispose();
    _roomCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
                text: 'Join Room',
                shadows: [
                  Shadow(
                    color: Colors.blue,
                    blurRadius: 40,
                  )
                ],
                size: 50),
            SizedBox(
              height: height * 0.04,
            ),
            CustomTextField(
              hintText: 'enter your nickname',
              controller: _nameCodeController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'enter the room code',
              controller: _roomCodeController,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            CustomButton(
                title: 'Join',
                onPressed: () {
                  final roomCode = _roomCodeController.text.trim();
                  final nickName = _nameCodeController.text.trim();
                  if (roomCode.isNotEmpty && nickName.isNotEmpty) {
                    _socketMethods.joinRoom(nickName, roomCode);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
