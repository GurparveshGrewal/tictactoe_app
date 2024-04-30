import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_app/provider/room_data_provider.dart';

class ScoreBoardWidget extends StatelessWidget {
  const ScoreBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final roomDatProvider = Provider.of<RoomDataProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                roomDatProvider.player1.nickname,
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                roomDatProvider.player1.points.toInt().toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                roomDatProvider.player2.nickname,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                roomDatProvider.player2.points.toInt().toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
