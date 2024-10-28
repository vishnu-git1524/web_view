import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/Navigation/navigation.dart';
import 'presentation/themes/theme.dart';
import 'provider/GamePlatforms/gameplatforms_provider.dart';
import 'provider/GameProvider/game_provider.dart';
import 'provider/NavigationProvider/navigation_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NavigationProvider()),
    ChangeNotifierProvider(create: (_) => GameProvider()),
    ChangeNotifierProvider(create: (_) => PlatformProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: const Navigation(),
    );
  }
}
