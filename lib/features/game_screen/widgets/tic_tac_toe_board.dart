import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_app/provider/room_data_provider.dart';
import 'package:tictactoe_app/resources/socket/socket_methods.dart';

class TicTacToeBoardWidget extends StatefulWidget {
  const TicTacToeBoardWidget({super.key});

  @override
  State<TicTacToeBoardWidget> createState() => _TicTacToeBoardWidgetState();
}

class _TicTacToeBoardWidgetState extends State<TicTacToeBoardWidget> {
  final SocketMethods _socketMethods = SocketMethods();

  void tapped(
    int index,
    RoomDataProvider provider,
  ) {
    _socketMethods.tapGrid(
      index,
      provider.roomData['_id'],
      provider.displayElements,
    );
  }

  @override
  void initState() {
    super.initState();
    _socketMethods.tappedListener(context);
  }

  @override
  Widget build(BuildContext context) {
    final roomDataProvider = Provider.of<RoomDataProvider>(context);
    final size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
        maxWidth: 500,
      ),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: 9,
          itemBuilder: (context, index) {
            return AbsorbPointer(
              absorbing: roomDataProvider.roomData['turn']['socketId'] !=
                  _socketMethods.socketClient.id,
              child: GestureDetector(
                onTap: () => tapped(index, roomDataProvider),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Center(
                      child: Text(
                    roomDataProvider.displayElements[index],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                        shadows: [
                          Shadow(
                            blurRadius: 50,
                            color:
                                roomDataProvider.displayElements[index] == 'O'
                                    ? Colors.red
                                    : Colors.blue,
                          )
                        ]),
                  )),
                ),
              ),
            );
          }),
    );
  }
}
