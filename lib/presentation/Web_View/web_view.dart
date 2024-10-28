// lib/screens/web_view_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_view/provider/GamePlatforms/gameplatforms_provider.dart';

import 'web/web.dart';

class WebView extends StatelessWidget {
  const WebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gaming Platforms"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<PlatformProvider>(
          builder: (context, platformProvider, child) {
            final platforms = platformProvider.platforms;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two cards per row
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 0.75,
              ),
              itemCount: platforms.length,
              itemBuilder: (context, index) {
                final platform = platforms[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlatformWebView(url: platform['url']!),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Platform Image with Loading Indicator
                        Expanded(
                          child: Image.network(
                            platform['image']!,
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
                          child: Text(
                            platform['name']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
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

