import 'package:diet_app/core/app/app_theme.dart';
import 'package:diet_app/features/home/presentation/screens/ibw_bmi_bmr_tee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


/// Home screen for the diet app.
/// 
/// Main dashboard showing overview of diet plans, recent activities, etc.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('EatSmart', style: headlineSmallBoldTextStyle(color: theme.colorScheme.primary),),
        foregroundColor: theme.colorScheme.primary,
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add_outlined,
        // animatedIcon: AnimatedIcons.list_view,
        animatedIconTheme: IconThemeData(size: Spacing.xlWidth),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        overlayColor: theme.colorScheme.primary,
        overlayOpacity: 0.2,
        onOpen: () => debugPrint('Speed dial opened'),
        onClose: () => debugPrint('Speed dial closed'),
        elevation: 8.0,
        animationCurve: Curves.elasticInOut,
        children: [
          SpeedDialChild(
            child: Icon(Icons.person, color: theme.colorScheme.onPrimary),
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: Colors.white,
            label: 'Add Client',
            labelStyle: bodySmallTextStyle(color: theme.colorScheme.onPrimary),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FormulasCalculator()));
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.local_fire_department, color: Colors.white),
            backgroundColor: theme.colorScheme.error,
            foregroundColor: Colors.white,
            label: 'Track Calories',
            labelStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
            onTap: () {
              // TODO: Navigate to calorie tracking
              debugPrint('Track Calories tapped');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [theme.colorScheme.primary, theme.colorScheme.primary.withValues(alpha: 0.6)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back!',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ready to track your nutrition today?',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Example: Gradient Text Style
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.secondary,
                  theme.colorScheme.tertiary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                'Gradient Style Example',
                style: TextStyleUtils.gradient(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ShaderMask(
              shaderCallback: (bounds) => RadialGradient(
                colors: [
                  theme.colorScheme.error,
                  theme.colorScheme.primary,
                ],
                center: Alignment.center,
                radius: 1.0,
              ).createShader(bounds),
              child: Text(
                'This text uses gradient styling with a radial gradient effect.',
                style: TextStyleUtils.gradient(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Quick stats
            Text(
              'Today\'s Overview',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    theme: theme,
                    title: 'Calories',
                    value: '1,200',
                    subtitle: 'of 2,000',
                    icon: Icons.local_fire_department,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _StatCard(
                    theme: theme,
                    title: 'Water',
                    value: '6',
                    subtitle: 'glasses',
                    icon: Icons.water_drop,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    theme: theme,
                    title: 'Meals',
                    value: '3',
                    subtitle: 'planned',
                    icon: Icons.restaurant,
                    color: theme.colorScheme.tertiary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _StatCard(
                    theme: theme,
                    title: 'Exercise',
                    value: '30',
                    subtitle: 'minutes',
                    icon: Icons.fitness_center,
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}


class _StatCard extends StatelessWidget {
  final ThemeData theme;
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.theme,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

