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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    size: 60,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'AI Chatbot',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Version 1.0.0',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
              const SizedBox(height: 32),
              _buildSection(
                context,
                'About the App',
                'This is an AI-powered chatbot application developed as a class assignment. '
                    'It demonstrates the integration of modern AI technology with mobile applications '
                    'using Flutter framework.',
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                'Technology Stack',
                '• Flutter & Dart\n'
                    '• Hugging Face AI Models\n'
                    '• Material Design 3\n'
                    '• Provider State Management',
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                'Features',
                '• Real-time AI responses\n'
                    '• Modern chat interface\n'
                    '• Message history\n'
                    '• Error handling\n'
                    '• Cross-platform support',
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                'Disclaimer',
                'This application uses a free AI model that may not provide the most accurate '
                    'or coherent responses. The responses are generated based on the model\'s training '
                    'data and may not always be relevant or helpful. This is a demonstration project '
                    'and should be used for educational purposes only.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.5,
              ),
        ),
      ],
    );
  }
}
