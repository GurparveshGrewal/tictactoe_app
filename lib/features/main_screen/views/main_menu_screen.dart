import 'package:flutter/material.dart';
import 'package:tictactoe_app/features/main_screen/views/create_room_screen.dart';
import 'package:tictactoe_app/features/main_screen/views/join_room_screen.dart';
import 'package:tictactoe_app/utils/commons/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static const String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.of(context).pushNamed(CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.of(context).pushNamed(JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/gifs/tictactoe.gif',
                fit: BoxFit.cover,
                height: height * 0.4,
                width: width * 0.8,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                title: 'Create Room', onPressed: () => createRoom(context)),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
                title: 'Join Room', onPressed: () => joinRoom(context)),
          ],
        ),
      ),
    );
  }
}
