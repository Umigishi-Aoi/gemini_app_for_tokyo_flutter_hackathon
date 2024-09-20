import 'package:flutter/material.dart';
import 'package:gemini_app_for_tokyo_flutter_hackathon/presentation/suggestion_page.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiForTokyoFlutterHackathon extends StatelessWidget {
  const GeminiForTokyoFlutterHackathon({
    super.key,
    required this.model,
  });

  final GenerativeModel model;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.lightBlue),
      home: SelectionArea(
        child: SuggestionPage(
          model: model,
        ),
      ),
    );
  }
}
