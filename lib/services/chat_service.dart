import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/message.dart';

class ChatService {
  final String baseUrl =
      'https://api-inference.huggingface.co/models/facebook/opt-350m';

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'inputs': message,
          'parameters': {
            'max_length': 100,
            'temperature': 0.7,
            'top_p': 0.9,
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data[0]['generated_text'];
      } else {
        throw Exception('Failed to get response from Hugging Face API');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
