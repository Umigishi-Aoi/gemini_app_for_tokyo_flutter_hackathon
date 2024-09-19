import 'package:flutter/material.dart';
import 'package:gemini_app_for_tokyo_flutter_hackathon/presentation/suggestion_page.dart';

class GeminiForTokyoFlutterHackathon extends StatelessWidget {
  const GeminiForTokyoFlutterHackathon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.lightBlue),
      home: const SuggestionPage(),
    );
  }
}
