import 'package:flutter/material.dart';

/// Schedule screen for managing appointments and calendar.
/// 
/// Shows upcoming appointments, schedule management, and calendar view.
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Add new appointment functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's date
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.primary.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Text(
                    'Today',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getCurrentDate(),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colors.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Upcoming appointments
            Text(
              'Upcoming Appointments',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Sample appointments
            _AppointmentCard(
              clientName: 'Sarah Johnson',
              time: '10:00 AM',
              duration: '60 min',
              type: 'Nutrition Consultation',
              status: 'Confirmed',
            ),
            const SizedBox(height: 12),
            
            _AppointmentCard(
              clientName: 'Mike Chen',
              time: '2:00 PM',
              duration: '45 min',
              type: 'Follow-up',
              status: 'Confirmed',
            ),
            const SizedBox(height: 12),
            
            _AppointmentCard(
              clientName: 'Emma Davis',
              time: '4:30 PM',
              duration: '30 min',
              type: 'Quick Check',
              status: 'Pending',
            ),
            const SizedBox(height: 24),
            
            // This week's schedule
            Text(
              'This Week',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            _WeekScheduleCard(
              day: 'Monday',
              appointments: 3,
              timeSlots: ['9:00 AM', '2:00 PM', '4:00 PM'],
            ),
            const SizedBox(height: 8),
            
            _WeekScheduleCard(
              day: 'Tuesday',
              appointments: 2,
              timeSlots: ['10:30 AM', '3:00 PM'],
            ),
            const SizedBox(height: 8),
            
            _WeekScheduleCard(
              day: 'Wednesday',
              appointments: 4,
              timeSlots: ['9:00 AM', '11:00 AM', '2:00 PM', '5:00 PM'],
            ),
            const SizedBox(height: 8),
            
            _WeekScheduleCard(
              day: 'Thursday',
              appointments: 1,
              timeSlots: ['1:00 PM'],
            ),
            const SizedBox(height: 8),
            
            _WeekScheduleCard(
              day: 'Friday',
              appointments: 2,
              timeSlots: ['10:00 AM', '3:30 PM'],
            ),
          ],
        ),
      ),
    );
  }

  String _getCurrentDate() {
    final now = DateTime.now();
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    final weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    
    return '${weekdays[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}, ${now.year}';
  }
}

class _AppointmentCard extends StatelessWidget {
  final String clientName;
  final String time;
  final String duration;
  final String type;
  final String status;

  const _AppointmentCard({
    required this.clientName,
    required this.time,
    required this.duration,
    required this.type,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    Color statusColor;
    switch (status) {
      case 'Confirmed':
        statusColor = colors.primary;
        break;
      case 'Pending':
        statusColor = colors.tertiary;
        break;
      case 'Cancelled':
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
      child: Row(
        children: [
          Container(
            width: 4,
            height: 60,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clientName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  type,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: colors.onSurface.withOpacity(0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$time • $duration',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
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
    );
  }
}

class _WeekScheduleCard extends StatelessWidget {
  final String day;
  final int appointments;
  final List<String> timeSlots;

  const _WeekScheduleCard({
    required this.day,
    required this.appointments,
    required this.timeSlots,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outline.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$appointments appointment${appointments != 1 ? 's' : ''}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: timeSlots.map((slot) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: colors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      slot,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
          Icon(
            Icons.calendar_today,
            color: colors.primary,
            size: 24,
          ),
        ],
      ),
    );
  }
}
