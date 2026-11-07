import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MessageScreen(),
    );
  }
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  static const List<String> _predefinedMessages = [
    'Hello! You pressed the button.',
    'Welcome to your mobile app!',
  ];

  String _displayedText = 'Press the button below.';
  int _nextMessageIndex = 0;

  void _updateMessage() {
    setState(() {
      _displayedText = _predefinedMessages[_nextMessageIndex];
      _nextMessageIndex = (_nextMessageIndex + 1) % _predefinedMessages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message App')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _displayedText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(160, 48),
                ),
                onPressed: _updateMessage,
                child: const Text('Show Message'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
