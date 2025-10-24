import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Splash screen widget with diet app branding and navigation logic.
///
/// Shows app logo, name, and automatically navigates to home after delay.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigateToHome();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _animationController.forward();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/home');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB), // Light cream background
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFDFCFB), // Light cream background
        ),
        child: SafeArea(
          child: Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Image.asset('assets/images/app_logo.png'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom painter for the bowl and leaf logo
class BowlLeafPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Bowl - U-shaped outline
    final bowlPath = Path();
    bowlPath.moveTo(centerX - 25, centerY + 10);
    bowlPath.quadraticBezierTo(centerX - 25, centerY + 20, centerX - 15, centerY + 20);
    bowlPath.lineTo(centerX + 15, centerY + 20);
    bowlPath.quadraticBezierTo(centerX + 25, centerY + 20, centerX + 25, centerY + 10);

    // Bowl gradient
    final bowlGradient = LinearGradient(
      colors: [
        const Color(0xFF00BCD4), // Cyan
        const Color(0xFF2196F3), // Blue
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
    paint.shader = bowlGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(bowlPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
