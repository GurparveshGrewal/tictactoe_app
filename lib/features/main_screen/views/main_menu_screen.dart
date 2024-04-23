import 'package:flutter/material.dart';
import 'package:tictactoe_app/utils/commons/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(title: 'Join Room', onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
            CustomButton(title: 'Create Room', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
