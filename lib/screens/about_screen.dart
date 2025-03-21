import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AI Chatbot',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Version 1.0.0',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            const Text(
              'This is an AI-powered chatbot application that uses OpenAI\'s GPT-3.5 model to provide intelligent responses to your messages. The application is built using Flutter and implements modern Material Design principles.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Features:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• Real-time AI responses'),
                Text('• Modern chat interface'),
                Text('• Message history'),
                Text('• Error handling'),
                Text('• Material Design 3'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
