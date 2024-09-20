import 'package:flutter/material.dart';
import 'package:gemini_app_for_tokyo_flutter_hackathon/constants/function_calling_setting.dart';
import 'package:gemini_app_for_tokyo_flutter_hackathon/constants/gemini_prompt.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key, required this.model});

  final GenerativeModel model;

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  final TextEditingController controller = TextEditingController();

  bool isLoading = false;
  String? answer = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('地名を入力してください。おすすめグルメを教えます。'),
            SizedBox(
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '東京',
                  hintStyle: TextStyle(color: Theme.of(context).hintColor),
                ),
                controller: controller,
              ),
            ),
            ElevatedButton(
              onPressed: _getAnswer,
              child: const Text('Geminiに聞く'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 320,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Center(child: Text(answer!)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getAnswer() async {
    setState(() {
      isLoading = true;
    });

    final contents = [
      Content.text(geminiPrompt),
      Content.text(controller.text),
    ];

    GenerateContentResponse? response;
    try {
      response = await widget.model.generateContent(contents);
    } on Exception catch (e) {
      answer = 'エラーが発生しました1。 $e';
      setState(() {
        isLoading = false;
      });

      return;
    }

    final functionCalls = response.functionCalls.toList();

    try {
      if (functionCalls.isNotEmpty) {
        final functionCall = functionCalls.first;

        answer = switch (functionCall.name) {
          'setFood' => setFood(functionCall.args),
          _ => throw UnimplementedError(
              'Function not implemented: ${functionCall.name}',
            )
        };
      }
    } on Exception catch (e) {
      answer = 'エラーが発生しました2。 $e';
      setState(() {
        isLoading = false;
      });

      return;
    }

    if (answer == null) {
      answer = '回答できませんでした';

      setState(() {
        isLoading = false;
      });

      return;
    }

    setState(() {
      isLoading = false;
    });
  }
}
