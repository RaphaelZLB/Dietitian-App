import 'package:flutter/material.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Client'),
      ),
      body: const Center(
        child: Text('Add Client'),
      ),
    );
  }
}