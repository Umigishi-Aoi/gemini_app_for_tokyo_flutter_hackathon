import 'package:google_generative_ai/google_generative_ai.dart';

final answerController = FunctionDeclaration(
  'setFood',
  '質問の回答の食べ物の名前を一つ選んでセットしてください',
  Schema(
    SchemaType.object,
    properties: {
      'food': Schema(
        SchemaType.string,
        description: '食べ物の名前',
      ),
    },
    requiredProperties: [
      'food',
    ],
  ),
);

String? setFood(
  Map<String, Object?> arguments,
) =>
    arguments['food'] as String?;
