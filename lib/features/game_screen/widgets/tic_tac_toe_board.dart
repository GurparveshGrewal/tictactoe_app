import 'package:flutter/material.dart';

class TicTacToeBoardWidget extends StatefulWidget {
  const TicTacToeBoardWidget({super.key});

  @override
  State<TicTacToeBoardWidget> createState() => _TicTacToeBoardWidgetState();
}

class _TicTacToeBoardWidgetState extends State<TicTacToeBoardWidget> {
  @override
  Widget build(BuildContext context) {
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
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
              ),
              child: const Center(
                  child: Text(
                'X',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 100,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.blue,
                      )
                    ]),
              )),
            );
          }),
    );
  }
}
