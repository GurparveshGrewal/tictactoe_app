import 'package:flutter/material.dart';
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
      home: const MainMenuScreen(),
    );
  }
}
