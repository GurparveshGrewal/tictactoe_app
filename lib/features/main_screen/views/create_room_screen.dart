import 'package:flutter/material.dart';
import 'package:tictactoe_app/utils/commons/widgets/custom_text.dart';
import 'package:tictactoe_app/utils/commons/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static const String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _roomCodeController = TextEditingController();

  @override
  void dispose() {
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
                text: 'Create Room',
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
              controller: _roomCodeController,
            )
          ],
        ),
      ),
    );
  }
}
