import 'package:flutter/material.dart';
import 'package:tictactoe_app/features/main_screen/views/create_room_screen.dart';
import 'package:tictactoe_app/features/main_screen/views/join_room_screen.dart';
import 'package:tictactoe_app/features/main_screen/views/main_menu_screen.dart';
import 'package:tictactoe_app/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTacToe',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: AppColors.bgColor),
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
