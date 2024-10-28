// lib/screens/home.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/GameProvider/game_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Library"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<GameProvider>(
          builder: (context, gameProvider, child) {
            final games = gameProvider.games;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two cards per row
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 0.75, // Adjust to make cards smaller
              ),
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Game Image with Loading Indicator
                      Expanded(
                        child: Image.network(
                          game['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Game Name
                            Text(
                              game['name']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            // Game Description
                            Text(
                              game['description']!,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.deepPurple.shade300,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
