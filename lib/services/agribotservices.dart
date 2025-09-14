import 'dart:convert';
import 'package:http/http.dart' as http;

class AgriChatService {
  // IMPORTANT: Replace with your OpenAI API Key
  static const String _apiKey = 'YOUR_OPENAI_API_KEY';
  static const String _baseUrl = 'https://api.openai.com/v1/chat/completions';

  static final List<String> allowedKeywords = [
    'maize',
    'tomato',
    'soil',
    'fertilizer',
    'crop',
    'disease',
    'pest',
    'farming',
    'agriculture',
    'leaf'
  ];

  static bool isAgricultureQuestion(String input) {
    final lower = input.toLowerCase();
    return allowedKeywords.any((k) => lower.contains(k));
  }

  static Future<String> askAgriBot(String userInput) async {
    if (!isAgricultureQuestion(userInput)) {
      return 'I am an agriculture assistant. Please ask questions related to crops, soil, pests, or farming.';
    }

    try {
      final response = await http.post(Uri.parse(_baseUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $_apiKey',
          },
          body: jsonEncode({
            'model': 'gpt-4o-mini',
            'messages': [
              {
                'role': 'system',
                'content':
                    'You are AgriBot, an AI assistant for farmers. Only answer questions related to agriculture, crops, soil, livestock, and farming. If asked anything outside agriculture, politely refuse and redirect.'
              },
              {
                'role': 'user',
                'content': userInput,
              }
            ],
            'max_tokens': 250,
          }));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'];
        return content ?? 'No response from AI';
      } else {
        return 'AI error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error connecting to AI: $e';
    }
  }
}
