import 'package:flutter/material.dart';
import 'package:eldafit/Profile_Settings/profile_settings.dart'; // ✅ Import your profile settings page

class ProgressTrackerPage extends StatelessWidget {
  const ProgressTrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set default selected index
        onTap: (index) {
          // TODO: Implement navigation logic
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Progress Tracking'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
          const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressOverview(),
            const SizedBox(height: 16),
            _buildStrengthGainsChart(),
            const SizedBox(height: 16),
            _buildEnduranceProgressChart(),
            const SizedBox(height: 16),
            _buildWeeklyPhotoComparison(),
            const SizedBox(height: 16),
            _buildAchievements(),
            const SizedBox(height: 16),
            _buildWorkoutStreaks(),
            const SizedBox(height: 32),

            // ✅ Button to go to ProfileSettingsPage
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.person),
                label: const Text("Go to Profile Settings"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileSettingsPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressOverview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _ProgressMetric(title: 'Total Workouts', value: '42', icon: Icons.fitness_center),
          _ProgressMetric(title: 'Avg Duration', value: '45 min', icon: Icons.timer),
          _ProgressMetric(title: 'Calories Burned', value: '8,500', icon: Icons.local_fire_department),
        ],
      ),
    );
  }

  Widget _buildStrengthGainsChart() {
    return _buildPlaceholderCard('Strength Gains (Last 6 Months)');
  }

  Widget _buildEnduranceProgressChart() {
    return _buildPlaceholderCard('Endurance Progress (Minutes)');
  }

  Widget _buildWeeklyPhotoComparison() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Weekly Photo Comparison', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildPhotoCard('assets/photo1.png', 'March 1, 2024'),
            const SizedBox(width: 16),
            _buildPhotoCard('assets/photo2.png', 'April 26, 2024'),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Implement photo update
          },
          icon: const Icon(Icons.camera_alt),
          label: const Text('Update Photos'),
        ),
      ],
    );
  }

  Widget _buildAchievements() {
    final achievements = [
      'First Workout',
      '5-Day Streak',
      'Cardio Pro',
      'Goal Setter',
      '10-Day Streak',
      'Endurance Master'
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: achievements
          .map((ach) => Chip(
                label: Text(ach),
                backgroundColor: Colors.teal.shade50,
              ))
          .toList(),
    );
  }

  Widget _buildWorkoutStreaks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _ProgressMetric(title: 'Current Streak', value: '5', icon: Icons.local_fire_department),
        _ProgressMetric(title: 'Longest Streak', value: '12', icon: Icons.military_tech),
      ],
    );
  }

  Widget _buildPlaceholderCard(String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Icon(Icons.insert_chart_outlined),
        ],
      ),
    );
  }

  Widget _buildPhotoCard(String imagePath, String date) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 100,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 4),
        Text(date, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _ProgressMetric extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _ProgressMetric({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.teal),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
