import 'package:flutter/material.dart';

class PlatformProvider extends ChangeNotifier {
  final List<Map<String, String>> platforms = [
    {
      'name': 'Steam',
      'url': 'https://store.steampowered.com',
      'image': 'https://gamingstreet.com/wp-content/uploads/2020/03/steam-logo.jpg',
    },
    {
      'name': 'GOG',
      'url': 'https://www.gog.com',
      'image': 'https://th.bing.com/th/id/OIP.iFtQ1ytaCsL6g0USB-_ongHaEK?rs=1&pid=ImgDetMain',
    },
    {
      'name': 'Epic Games Store',
      'url': 'https://www.epicgames.com/store',
      'image': 'https://cdn2.unrealengine.com/Epic+Games+Node%2FepicLogo_1920x1080-1920x1080-401b77ef30fa9e5aaadbdd99ad2ff27ceda27a6f.png',
    },
    {
      'name': 'Itch.io',
      'url': 'https://itch.io',
      'image': 'https://th.bing.com/th/id/OIP.H1fwFmk7RH53WZGPVK6jRAHaEK?rs=1&pid=ImgDetMain',
    },
    {
      'name': 'Game Jolt',
      'url': 'https://gamejolt.com',
      'image': 'https://th.bing.com/th/id/OIP.lWtKVkcbVveICcrdhTuFDgHaD4?rs=1&pid=ImgDetMain',
    },
    {
      'name': 'Miniclip',
      'url': 'https://www.miniclip.com',
      'image': 'https://th.bing.com/th/id/OIP.ogfcZ_EzO3tS6WmpzIVdHwHaEK?rs=1&pid=ImgDetMain',
    },
  ];
}
