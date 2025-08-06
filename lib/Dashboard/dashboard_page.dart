import 'package:eldafit/WorkOut_Player/workout_player.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Dashboard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        actions: [
          const Icon(Icons.notifications_none, color: Colors.black),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: AssetImage('assets/dashboard.jpg'),
            radius: 16,
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Workout Card
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      'assets/workout_flow.png', // Replace with your real image
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Morning Flexibility Flow',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Joint-Friendly | Gentle Cardio',
                                style: TextStyle(color: Colors.black54)),
                            Icon(Icons.info_outline, size: 18),
                          ],
                        ),
                        const SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: 0.75,
                          backgroundColor: Colors.grey.shade300,
                          color: Colors.teal,
                        ),
                        const SizedBox(height: 4),
                        const Text('75% Complete', style: TextStyle(color: Colors.black54)),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown.shade400,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Start Workout'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Voice Guidance
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Voice Guidance', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('On: Guiding you through workouts.', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                  Switch(value: true, onChanged: null),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Progress Snapshot
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Your Progress Snapshot', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _ProgressItem(title: '15', subtitle: 'Workouts\nCompleted', icon: Icons.fitness_center),
                      _ProgressItem(title: '345', subtitle: 'Total\nMinutes', icon: Icons.timer_outlined),
                      _ProgressItem(title: '12 days', subtitle: 'Longest\nStreak', icon: Icons.emoji_events_outlined),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('View Full Progress'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Quick Actions
            const Text('Quick Actions', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _QuickAction(icon: Icons.medical_services_outlined, label: 'Emergency\nHelp'),
                _QuickAction(icon: Icons.menu_book_outlined, label: 'Educational\nContent'),
                _QuickAction(icon: Icons.fitness_center_outlined, label: 'Exercise\nLibrary'),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
     bottomNavigationBar: BottomNavigationBar(
  currentIndex: 0,
  selectedItemColor: Colors.teal,
  unselectedItemColor: Colors.grey,
  onTap: (index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WorkoutPlayer()),
      );
    }
    // You can add more `if` conditions for other indexes (e.g., Progress, Profile) if needed
  },
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Dashboard'),
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Library'),
    BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Progress'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
  ],
),

    );
  }
}

/// Reusable Widgets

class _ProgressItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _ProgressItem({required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.teal),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 28, color: Colors.teal),
        ),
        const SizedBox(height: 6),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
