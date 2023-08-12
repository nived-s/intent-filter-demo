import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const IntentFilterDemoApp());
}

class IntentFilterDemoApp extends StatelessWidget {
  const IntentFilterDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intent Filter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Intent Filter Demo'),
        ),
        body: Center(
          // Btn which redirect flutter app to specified url
          child: ElevatedButton(
            onPressed: () {
              // Launch the MainActivity with a webpage URL
              // The action 'android.intent.action.VIEW' and data scheme 'http' match the intent filter
              IntentFilterDemoApp.startActivity('https://www.youtube.com/');
            },
            child: const Text('Open Youtube'),
          ),
        ),
      ),
    );
  }

  // Function to open url
  static Future<void> startActivity(String url) async {
    // Implement native code to start the MainActivity with the given URL
    var demoUrl = Uri.parse(url);
    if (await canLaunchUrl(demoUrl)) {
      await launchUrl(demoUrl);
    } else {
      throw 'Could not launch $url';
    }
  }
}
