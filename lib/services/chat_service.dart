import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/message.dart';

class ChatService {
  final String baseUrl =
      'https://api-inference.huggingface.co/models/facebook/opt-125m';
  // Replace this with your token from Hugging Face
  final String token = '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';

  Future<String> sendMessage(String message) async {
    int maxRetries = 3;
    int currentRetry = 0;

    while (currentRetry < maxRetries) {
      try {
        print(
            'Sending request to Hugging Face API... (Attempt ${currentRetry + 1})');
        print('Message: $message');

        final response = await http.post(
          Uri.parse(baseUrl),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            'inputs': message,
            'parameters': {
              'max_length': 100,
              'temperature': 0.7,
              'top_p': 0.9,
              'return_full_text': false,
            }
          }),
        );

        print('Response status code: ${response.statusCode}');
        print('Response headers: ${response.headers}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data is List && data.isNotEmpty && data[0] is Map) {
            return data[0]['generated_text'] ??
                'Sorry, I could not generate a response.';
          } else {
            print('Unexpected response format: $data');
            return 'Sorry, I could not process the response.';
          }
        } else if (response.statusCode == 503) {
          // Model is loading, wait and retry
          print('Model is loading, waiting before retry...');
          await Future.delayed(const Duration(seconds: 5));
          currentRetry++;
          continue;
        } else {
          print('Error response status: ${response.statusCode}');
          print('Error response headers: ${response.headers}');
          print('Error response body: ${response.body}');
          return 'Sorry, I encountered an error (Status: ${response.statusCode}). Please try again.';
        }
      } catch (e, stackTrace) {
        print('Error in sendMessage: $e');
        print('Stack trace: $stackTrace');
        currentRetry++;
        if (currentRetry < maxRetries) {
          await Future.delayed(const Duration(seconds: 2));
          continue;
        }
        return 'Sorry, I encountered an error. Please try again.';
      }
    }

    return 'Sorry, the model is currently unavailable. Please try again in a few moments.';
  }
}
