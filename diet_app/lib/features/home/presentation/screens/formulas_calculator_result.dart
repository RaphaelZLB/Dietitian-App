import 'package:flutter/material.dart';

class FormulasCalculatorResult extends StatelessWidget {
  const FormulasCalculatorResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Formulas Calculator Result'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}