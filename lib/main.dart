import 'package:flutter/material.dart';
import 'package:gemini_app_for_tokyo_flutter_hackathon/constants/function_calling_setting.dart';
import 'package:gemini_app_for_tokyo_flutter_hackathon/constants/gemini_api_key.dart';
import 'package:gemini_app_for_tokyo_flutter_hackathon/gemini_for_tokyo_flutter_hackathon.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: geminiApiKey,
    tools: [
      Tool(functionDeclarations: [answerController]),
    ],
  );

  runApp(GeminiForTokyoFlutterHackathon(model: model));
}
