import 'package:flutter/material.dart';

import 'main.dart';
import 'todo.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 작성'),
        actions: [
          IconButton(
            onPressed: () async {
              await todos.add(Todo(
                title: _textController.text,
                dateTime: DateTime.now().millisecondsSinceEpoch,
              ));
              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintStyle: const TextStyle(color: Colors.deepPurple),
            hintText: '할 일을 입력하세요',
            filled: true,
            fillColor: Colors.white60,
          ),
        ),
      ),
    );
  }
}
