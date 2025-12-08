import 'package:diet_app/features/home/presentation/screens/add_client_screen.dart';
import 'package:flutter/material.dart';

/// Clients screen for managing dietitian's clients.
/// 
/// Shows list of clients, their progress, and quick actions.
class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddClientScreen(),
                ),
              );
              // Refresh the clients list if a new client was added
              if (result == true) {
                // TODO: Refresh the clients list when client storage is integrated with UI
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Client added successfully!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search clients...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: colors.surface,
              ),
            ),
            const SizedBox(height: 24),
            
            // Clients list
            Text(
              'Active Clients',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Sample client cards
            _ClientCard(
              name: 'Sarah Johnson',
              email: 'sarah.j@email.com',
              lastVisit: '2 days ago',
              progress: 0.75,
              status: 'On Track',
            ),
            const SizedBox(height: 12),
            
            _ClientCard(
              name: 'Mike Chen',
              email: 'mike.chen@email.com',
              lastVisit: '1 week ago',
              progress: 0.45,
              status: 'Needs Attention',
            ),
            const SizedBox(height: 12),
            
            _ClientCard(
              name: 'Emma Davis',
              email: 'emma.davis@email.com',
              lastVisit: '3 days ago',
              progress: 0.90,
              status: 'Excellent',
            ),
            const SizedBox(height: 12),
            
            _ClientCard(
              name: 'David Wilson',
              email: 'david.w@email.com',
              lastVisit: '5 days ago',
              progress: 0.30,
              status: 'Behind Schedule',
            ),
          ],
        ),
      ),
    );
  }
}

class _ClientCard extends StatelessWidget {
  final String name;
  final String email;
  final String lastVisit;
  final double progress;
  final String status;

  const _ClientCard({
    required this.name,
    required this.email,
    required this.lastVisit,
    required this.progress,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    Color statusColor;
    switch (status) {
      case 'On Track':
        statusColor = colors.primary;
        break;
      case 'Excellent':
        statusColor = colors.secondary;
        break;
      case 'Needs Attention':
        statusColor = colors.tertiary;
        break;
      case 'Behind Schedule':
        statusColor = colors.error;
        break;
      default:
        statusColor = colors.outline;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outline.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: colors.primary.withOpacity(0.1),
                child: Text(
                  name.split(' ').map((n) => n[0]).join(),
                  style: TextStyle(
                    color: colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      email,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Progress bar
          Row(
            children: [
              Text(
                'Progress: ',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurface.withOpacity(0.7),
                ),
              ),
              Expanded(
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: colors.outline.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${(progress * 100).toInt()}%',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          Text(
            'Last visit: $lastVisit',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

