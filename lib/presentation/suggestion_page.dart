import 'package:flutter/material.dart';

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('地名を入力してください。'),
            SizedBox(
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '東京',
                  hintStyle: TextStyle(color: Theme.of(context).hintColor),
                ),
              ),
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
              child: const Text('ラーメン'),
            ),
          ],
        ),
      ),
    );
  }
}
