import 'package:diet_app/features/home/presentation/screens/formulas_calculator_result.dart';
import 'package:flutter/material.dart';

class FormulasCalculator extends StatefulWidget {
  const FormulasCalculator({super.key});

  @override
  State<FormulasCalculator> createState() => _FormulasCalculatorState();
}

class _FormulasCalculatorState extends State<FormulasCalculator> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _activityLevelController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _dietTypeController = TextEditingController();
  final TextEditingController _dietPlanController = TextEditingController();

  String? _selectedGender;
  String? _selectedActivityLevel;
  String? _selectedGoal;
  String? _selectedDietType;

  final List<String> _genders = ['Male', 'Female'];
  final List<String> _activityLevels = [
    'Inactive',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
    'Extremely Active'
  ];
  final List<String> _goals = [
    'Weight Loss',
    'Weight Gain',
    'Maintain Weight',
    'Muscle Gain'
  ];
  final List<String> _dietTypes = [
    'Vegetarian',
    'Vegan',
    'Keto',
    'Paleo',
    'Mediterranean',
    'Balanced'
  ];

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _activityLevelController.dispose();
    _goalController.dispose();
    _dietTypeController.dispose();
    _dietPlanController.dispose();
    super.dispose();
  }

  void _saveData() {
    // Validate all fields
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Save gender to controller
    _genderController.text = _selectedGender!;
    
    // Save activity level to controller
    _activityLevelController.text = _selectedActivityLevel!;
    
    // Save goal to controller
    _goalController.text = _selectedGoal!;
    
    // Save diet type to controller
    _dietTypeController.text = _selectedDietType!;

    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Information saved successfully!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => const FormulasCalculatorResult()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Client Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Height input
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Height (cm)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.height),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Height is required';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Weight input
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monitor_weight),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Weight is required';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Age input
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Age is required';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  final age = int.parse(value);
                  if (age < 1 || age > 150) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Gender dropdown
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                items: _genders.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Gender is required';
                  }
                  return null;
                },
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Activity Level dropdown
              DropdownButtonFormField<String>(
                value: _selectedActivityLevel,
                decoration: const InputDecoration(
                  labelText: 'Activity Level',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.fitness_center),
                ),
                items: _activityLevels.map((String level) {
                  return DropdownMenuItem<String>(
                    value: level,
                    child: Text(level),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Activity level is required';
                  }
                  return null;
                },
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedActivityLevel = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Goal dropdown
              DropdownButtonFormField<String>(
                value: _selectedGoal,
                decoration: const InputDecoration(
                  labelText: 'Goal',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.flag),
                ),
                items: _goals.map((String goal) {
                  return DropdownMenuItem<String>(
                    value: goal,
                    child: Text(goal),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Goal is required';
                  }
                  return null;
                },
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGoal = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Diet Type dropdown
              DropdownButtonFormField<String>(
                value: _selectedDietType,
                decoration: const InputDecoration(
                  labelText: 'Diet Type',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.restaurant),
                ),
                items: _dietTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDietType = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Diet Plan input
              TextFormField(
                controller: _dietPlanController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Diet Plan Comments',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.note),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 24),

              // Save button
              ElevatedButton(
                onPressed: _saveData,
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Save Information',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}