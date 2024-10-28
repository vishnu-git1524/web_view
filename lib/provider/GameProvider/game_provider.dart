import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  // Dummy game data
  final List<Map<String, String>> _games = [
    {
      'name': 'Space Invaders',
      'description': 'A classic arcade shooter.',
      'image':
          'https://i.etsystatic.com/12404978/r/il/d1fd5e/3138247750/il_1588xN.3138247750_d584.jpg',
    },
    {
      'name': 'Pac-Man',
      'description': 'Navigate mazes, avoid ghosts!',
      'image':
          'https://th.bing.com/th/id/OIP._q0RIw6ONA0cPpGk0F5IhwHaJb?rs=1&pid=ImgDetMain',
    },
    {
      'name': 'Tetris',
      'description': 'Arrange blocks to clear lines.',
      'image':
          'https://th.bing.com/th/id/OIP.x-ThwBTiI3m1oEqo2sFnUQHaEK?rs=1&pid=ImgDetMain',
    },
    {
      'name': 'Super Mario',
      'description': 'Save the princess!',
      'image':
          'https://th.bing.com/th/id/OIP.VUi0UwdFc5W6koHYpfT1WAHaHa?rs=1&pid=ImgDetMain',
    },
    {
      'name': 'Zelda',
      'description': 'Adventure with Link.',
      'image':
          'https://th.bing.com/th/id/OIP.HIqf4qi2TyBjvgGFUCBQRwHaDt?rs=1&pid=ImgDetMain',
    },
  ];

  List<Map<String, String>> get games => _games;
}
