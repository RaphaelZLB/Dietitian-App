import 'package:flutter/material.dart';

class FormulasCalculatorResult extends StatelessWidget {
  final double height;
  final double weight;
  final int age;
  final String gender;
  final String activityLevel;
  final String goal;
  final String? dietType;
  final String dietPlanComments;

  const FormulasCalculatorResult({
    super.key,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.activityLevel,
    required this.goal,
    this.dietType,
    required this.dietPlanComments,
  });

  // Calculate BMI: BMI = weight (kg) / (height in meters)²
  double _calculateBMI() {
    double heightInMeters = height / 100; // Convert cm to meters
    return weight / (heightInMeters * heightInMeters);
  }

  // Calculate IBW (Ideal Body Weight)
  // Formula: IBW = (height in cm - 100) * multiplier
  // Men: multiplier = 0.9, Women: multiplier = 0.85
  double _calculateIBW() {
    double multiplier = gender.toLowerCase() == 'male' ? 0.9 : 0.85;
    return (height - 100) * multiplier;
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bmi = _calculateBMI();
    final ibw = _calculateIBW();
    final bmiCategory = _getBMICategory(bmi);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Calculation Results'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Client Information Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Client Information',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Height', '${height.toStringAsFixed(1)} cm'),
                    _buildInfoRow('Weight', '${weight.toStringAsFixed(1)} kg'),
                    _buildInfoRow('Age', '$age years'),
                    _buildInfoRow('Gender', gender),
                    _buildInfoRow('Activity Level', activityLevel),
                    _buildInfoRow('Goal', goal),
                    if (dietType != null) _buildInfoRow('Diet Type', dietType!),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // BMI Card
            Card(
              elevation: 4,
              color: _getBMIColor(bmi).withOpacity(0.1),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: _getBMIColor(bmi), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.monitor_weight,
                          color: _getBMIColor(bmi),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'BMI (Body Mass Index)',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            bmi.toStringAsFixed(2),
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: _getBMIColor(bmi),
                                ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: _getBMIColor(bmi),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              bmiCategory,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Formula: BMI = Weight (kg) / (Height in meters)²',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // IBW Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.fitness_center,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'IBW (Ideal Body Weight)',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        '${ibw.toStringAsFixed(2)} kg',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Formula: IBW = (Height in cm - 100) × ${gender.toLowerCase() == 'male' ? '0.9' : '0.85'}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ),
            ),

            // Diet Plan Comments
            if (dietPlanComments.isNotEmpty) ...[
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Diet Plan Comments',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        dietPlanComments,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],

            const SizedBox(height: 24),

            // Close button
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Close',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Color _getBMIColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue; // Underweight
    } else if (bmi < 25) {
      return Colors.green; // Normal
    } else if (bmi < 30) {
      return Colors.orange; // Overweight
    } else {
      return Colors.red; // Obese
    }
  }
}