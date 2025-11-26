import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../services/app_state.dart';
import '../models/meetup.dart';

class MeetupsScreen extends StatelessWidget {
  const MeetupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Meetups'),
      ),
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          if (appState.meetups.isEmpty) {
            return const Center(
              child: Text('No meetups scheduled yet'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: appState.meetups.length,
            itemBuilder: (context, index) {
              final meetup = appState.meetups[index];
              return _MeetupCard(meetup: meetup);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddMeetupDialog(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Post Meetup'),
      ),
    );
  }

  void _showAddMeetupDialog(BuildContext context) {
    final titleController = TextEditingController();
    final instructorController = TextEditingController();
    final descriptionController = TextEditingController();
    final locationController = TextEditingController();
    final categoryController = TextEditingController();
    DateTime selectedDate = DateTime.now().add(const Duration(days: 1));

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Create New Meetup'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: instructorController,
                decoration: const InputDecoration(
                  labelText: 'Instructor Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category (e.g., Yoga, HIIT, Running)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  instructorController.text.isNotEmpty &&
                  locationController.text.isNotEmpty) {
                final meetup = Meetup(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleController.text,
                  instructor: instructorController.text,
                  description: descriptionController.text,
                  dateTime: selectedDate,
                  location: locationController.text,
                  latitude: 40.7128, // Default NYC coordinates
                  longitude: -74.0060,
                  category: categoryController.text.isNotEmpty
                      ? categoryController.text
                      : 'General',
                  maxParticipants: 20,
                  currentParticipants: 0,
                );
                Provider.of<AppState>(context, listen: false).addMeetup(meetup);
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}

class _MeetupCard extends StatelessWidget {
  final Meetup meetup;

  const _MeetupCard({required this.meetup});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('EEE, MMM dd');
    final timeFormat = DateFormat('h:mm a');

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with category
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: _getCategoryColor(meetup.category).withOpacity(0.1),
            child: Row(
              children: [
                Chip(
                  label: Text(meetup.category),
                  backgroundColor: _getCategoryColor(meetup.category),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (meetup.isFull)
                  const Chip(
                    label: Text('FULL'),
                    backgroundColor: Colors.red,
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                else
                  Chip(
                    label: Text('${meetup.availableSpots} spots left'),
                    backgroundColor: Colors.green,
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meetup.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 20,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      meetup.instructor,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  meetup.description,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 12),
                // Date and Time
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      dateFormat.format(meetup.dateTime),
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.access_time,
                      size: 20,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      timeFormat.format(meetup.dateTime),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Location
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 20,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        meetup.location,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Participants
                Row(
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 20,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${meetup.currentParticipants}/${meetup.maxParticipants} participants',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Join button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: meetup.isFull
                        ? null
                        : () {
                            Provider.of<AppState>(context, listen: false)
                                .joinMeetup(meetup.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Joined "${meetup.title}"!'),
                              ),
                            );
                          },
                    icon: Icon(meetup.isFull ? Icons.block : Icons.check_circle_outline),
                    label: Text(meetup.isFull ? 'Meetup Full' : 'Join Meetup'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'yoga':
        return Colors.purple;
      case 'hiit':
        return Colors.red;
      case 'running':
        return Colors.orange;
      case 'cycling':
        return Colors.blue;
      case 'swimming':
        return Colors.cyan;
      default:
        return Colors.teal;
    }
  }
}
