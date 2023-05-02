import 'package:dart_openai/openai.dart';

const String apiKey = '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';
String output = "";
Future<String> getResponse(String text) async {
  OpenAI.apiKey = apiKey;

  final completion = await OpenAI.instance.completion.create(
    model: "text-davinci-003",
    prompt: text,
    maxTokens: 50,
  );
  output = completion.choices[0].text;
  return output;
  // print(completion);
  // print(completion.choices);

  // // Generate an image from a prompt.
  // final image = await OpenAI.instance.image.create(
  //   prompt: "dog",
  //   n: 1,
  // );

  // // Printing the output to the console.
  // print(image.data.first.url);

  // // create a moderation
  // final moderation = await OpenAI.instance.moderation.create(
  //   input: "I will cut your head off",
  // );

  // // Printing moderation
  // print(moderation.results.first.categories.violence);
}
